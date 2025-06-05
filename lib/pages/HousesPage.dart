import 'package:dev_02/pages/HouseDetailScreen.dart';
import 'package:dev_02/pages/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({super.key});

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {

  final user = FirebaseAuth.instance.currentUser;

  signout()async{
    await FirebaseAuth.instance.signOut();
  }
  int myIndex = 0;

  final List<String> titles = [
    "Wisdom of Westeros",
    "Wings of Valyria",
    "Theories & Lore"
  ];

  final List<Widget> widgetList = [
    buildHouses(),
    buildDragon(),
    buildTheory(),
  ];


// Main Function


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        title: Text(titles[myIndex],style: TextStyle(fontFamily: 'GameOfThrones',fontSize: 18,color: AppColors.royal_gold),),
        centerTitle: false,
        actions: [
          IconButton(
            icon:  Icon(Icons.logout,color:AppColors.royal_gold ,),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: widgetList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        showUnselectedLabels: false,
        selectedItemColor: AppColors.royal_gold,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: AppColors.royal_gold,), label: "Houses" ),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot,color: AppColors.royal_gold), label: "Dragons"),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb,color: AppColors.royal_gold), label: "Theory"),
        ],
      ),
    );
  }
}

// Houses Detail Function


class House {
  final String name;
  final String imgUrl;
  final String description;

  House({required this.name, required this.imgUrl, required this.description});
}

Future<List<House>> loadHousesFromXml() async {
  final xmlString = await rootBundle.loadString('assets/data/houses.xml');
  final document = XmlDocument.parse(xmlString);

  final items = document.findAllElements('item');

  return items.map((node) {
    final name = node.findElements('name').single.text;
    final image = node.findElements('image').single.text;
    final description = node.findElements('description').single.text;
    return House(name: name, imgUrl: image, description: description);
  }).toList();
}

Widget buildHouses() {
  return FutureBuilder<List<House>>(
    future: loadHousesFromXml(),
    builder: (context, snapshot) {
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
                              )
                            ],
                          ),
                        ),
                      ),
                    )
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

// Dragons Page



Widget buildDragon() {
  return Center(
    child: Text(
      "Dragons Are Coming Soon",
      style: TextStyle(fontSize: 18,color: AppColors.royal_gold),
    ),
  );
}


// Theories Page


Widget buildTheory() {
  return Center(
    child: Text(
      "Theories & Lore Coming Soon",
      style: TextStyle(fontSize: 18,color: AppColors.royal_gold),
    ),
  );
}
