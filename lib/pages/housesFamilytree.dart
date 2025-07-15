import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Houses_List.dart';
import 'colors.dart';

class familytree extends StatefulWidget {
  const familytree({super.key});

  @override
  State<familytree> createState() => _familytreeState();
}

class _familytreeState extends State<familytree> {
  @override
  Future<List<House>> loadHousesFromFirebase() async {
    final DatabaseReference dbref = FirebaseDatabase.instance.ref("houses");
    final DatabaseEvent event = await dbref.once();
    final Data = event.snapshot.value;

    List<House> houseslist = [];

    if (Data is List) {
      for (var element in Data) {
        if (element != null) {
          houseslist.add(House.fromMap(Map<String, dynamic>.from(element)));
        }
      }
    } else if (Data is Map) {
      Data.forEach((key, value) {
        houseslist.add(House.fromMap(Map<String, dynamic>.from(value)));
      });
    }
    return houseslist;
  }

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
      body: FutureBuilder<List<House>>(
        future: loadHousesFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.royal_gold),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.royal_gold),
            );
          }
          final houses_tree = snapshot.data ?? [];
          return GridView.builder(
            itemCount: houses_tree.length,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final H = houses_tree[index];
              return GestureDetector(
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
                          child: Image.asset(
                            H.imgUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              H.name,
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
                        SizedBox(height: 30),
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
