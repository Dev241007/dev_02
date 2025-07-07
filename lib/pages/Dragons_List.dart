import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'DragonsDetailScreen.dart';
import 'colors.dart';

class Dragons {
  final String name;
  final String imgurl;
  final String description;

  Dragons({
    required this.name,
    required this.imgurl,
    required this.description,
  });
  factory Dragons.fromMap(Map<String, dynamic> map) {
    return Dragons(
      name: map['name'] ?? '',
      imgurl: map['image'] ?? '',
      description: map['description'] ?? '',
    );
  }
}

Future<List<Dragons>> loadDragonsFromFirebase() async {
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref("dragons");
  final DatabaseEvent event = await dbRef.once();
  final snapshotValue = event.snapshot.value;

  List<Dragons> dragonsList = [];

  if (snapshotValue is List) {
    for (var element in snapshotValue) {
      if (element != null) {
        dragonsList.add(Dragons.fromMap(Map<String, dynamic>.from(element)));
      }
    }
  } else if (snapshotValue is Map) {
    snapshotValue.forEach((key, value) {
      dragonsList.add(Dragons.fromMap(Map<String, dynamic>.from(value)));
    });
  }
return dragonsList;
}

Widget buildDragon() {
  return FutureBuilder<List<Dragons>>(
    future: loadDragonsFromFirebase(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(color: AppColors.royal_gold,));
      }
      if (snapshot.hasError) {
        return Center(child: Text("Error loading legends"));
      }

      final dragons = snapshot.data ?? [];
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: dragons.length,
        itemBuilder: (context, index) {
          final D = dragons[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dragonsdetailscreen(
                    dragonsName: D.name,
                    imageurl: D.imgurl,
                    description: D.description,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 150,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(D.imgurl, fit: BoxFit.cover),
                    Container(color: Colors.black.withOpacity(0.5)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          D.name,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 20,
                            fontFamily: 'GameOfThrones',
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
  );
}
