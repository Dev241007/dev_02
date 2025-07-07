
// Theories Page
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'LegendDetailScreen.dart';
import 'colors.dart';

class Legends {
  final String name;
  final String imgurl;
  final String description;

  Legends({
    required this.name,
    required this.imgurl,
    required this.description,
  });
  factory Legends.fromMap(Map<String , dynamic> map){
    return Legends(name: map['name'] ?? '', imgurl: map['image'] ?? '', description: map['description'] ??'');
  }
}

Future<List<Legends>> loadLegendsFromFirebase() async {
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref("legends");
  final DatabaseEvent event = await dbRef.once();
  final data = event.snapshot.value;

  List<Legends> legendsList = [];

  if(data is List){
    for (var element in data){
      if(element != null){
        legendsList.add(Legends.fromMap(Map<String, dynamic>.from(element)));
      }
    }
  } else if(data is Map){
    data.forEach((key,value){
      legendsList.add(Legends.fromMap(Map<String,dynamic>.from(value)));
    });
  }
  return legendsList;
}

Widget buildLegends() {
  return FutureBuilder<List<Legends>>(
    future: loadLegendsFromFirebase(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(color: AppColors.royal_gold,));
      }
      if (snapshot.hasError) {
        return Center(child: CircularProgressIndicator(color: AppColors.royal_gold,));
      }

      final legends = snapshot.data ?? [];
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: legends.length,
        itemBuilder: (context, index) {
          final L = legends[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Legenddetailscreen(legendName: L.name, imageurl: L.imgurl, description: L.description)));
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 159,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(L.imgurl, fit: BoxFit.cover),
                    Container(color: Colors.black.withOpacity(0.5)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          L.name,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 20,
                            fontFamily: 'GameOfThrones',
                            shadows: [
                              Shadow(
                                blurRadius: 7,
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
