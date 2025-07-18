import 'package:dev_02/pages/FamlyTree.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class Housestree {
  final String name;
  final String imgUrl;
  final String Houses_Tree_Image;

  Housestree({required this.name, required this.imgUrl , required this.Houses_Tree_Image});

  factory Housestree.fromMap(Map<String, dynamic> map) {
    return Housestree(
      name: map['name'] ?? '',
      imgUrl: map['image'] ?? '',
      Houses_Tree_Image: map['tree_image'] ?? '',
    );
  }
}

class FamilyTreeScreen extends StatefulWidget {
  const FamilyTreeScreen({super.key});

  @override
  State<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends State<FamilyTreeScreen> {
  Future<List<Housestree>> loadHousesFromFirebase() async {
    final DatabaseReference dbref = FirebaseDatabase.instance.ref("house_tree");
    final DatabaseEvent event = await dbref.once();
    final data = event.snapshot.value;

    List<Housestree> houseslist = [];

    if (data is List) {
      for (var element in data) {
        if (element != null) {
          houseslist.add(Housestree.fromMap(Map<String, dynamic>.from(element)));
        }
      }
    } else if (data is Map) {
      data.forEach((key, value) {
        houseslist.add(Housestree.fromMap(Map<String, dynamic>.from(value)));
      });
    }
    return houseslist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.royal_gold),
        ),
        title: Text(
          "Family Tree",
          style: TextStyle(
            fontFamily: 'GameOfThrones',
            fontSize: 16,
            color: AppColors.royal_gold,
          ),
        ),
      ),
      body: FutureBuilder<List<Housestree>>(
        future: loadHousesFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.royal_gold),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error loading data", style: TextStyle(color: Colors.white)),
            );
          }
          final housesTree = snapshot.data ?? [];
          return GridView.builder(
            itemCount: housesTree.length,
            padding: const EdgeInsets.only(bottom: 60,left: 8,right: 8,top: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final house = housesTree[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FamilyTree(Name: house.name, TreeImage: house.Houses_Tree_Image)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child:  Image.network(
                            house.imgUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingprogress) {
                              if (loadingprogress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(color: AppColors.royal_gold),
                              );
                            },
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              house.name,
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontFamily: 'GameOfThrones',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                shadows: [
                                  Shadow(
                                    blurRadius: 8,
                                    color: Colors.black,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
