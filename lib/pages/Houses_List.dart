
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'HouseDetailScreen.dart';
import 'colors.dart';

class House {
  final String name;
  final String imgUrl;
  final String description;

  House({required this.name, required this.imgUrl, required this.description});
  factory House.fromMap(Map<String, dynamic> map) {
    return House(
      name: map['name'] ?? '',
      imgUrl: map['image'] ?? '',
      description: map['description'] ?? '',
    );
  }
}

Future<List<House>> loadHousesFromFirebase() async {
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref("houses");
  final DatabaseEvent event = await dbRef.once();
  final Data = event.snapshot.value ;

  List<House> houseslist =[];

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

Widget buildHouses() {
  return FutureBuilder<List<House>>(
    future: loadHousesFromFirebase(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(color: AppColors.royal_gold,));
      }
      if(snapshot.hasError){
        return Center(child: CircularProgressIndicator(color: AppColors.royal_gold,));
      }
      final houses = snapshot.data ?? [];
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: houses.length,
        itemBuilder: (context, index) {
          final h = houses[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Housedetailscreen(
                    houseName: h.name,
                    imageUrl: h.imgUrl,
                    description: h.description,
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
                    Image.asset(h.imgUrl, fit: BoxFit.cover),
                    Container(color: Colors.black.withOpacity(0.5)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: h.name,
                          child: Text(
                            h.name,
                            style: const TextStyle(
                              color: Colors.white,
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