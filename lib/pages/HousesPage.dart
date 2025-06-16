import 'package:dev_02/pages/DragonsDetailScreen.dart';
import 'package:dev_02/pages/LegendDetailScreen.dart';
import 'package:dev_02/pages/Map.dart';
import 'package:dev_02/pages/HouseDetailScreen.dart';
import 'package:dev_02/pages/colors.dart';
import 'package:dev_02/pages/housesFamilytree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:xml/xml.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({super.key});

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  int myIndex = 0;

  final List<String> titles = [
    "Wisdom of Westeros",
    "Wings of Valyria",
    "Legends of Westeros",
  ];

  final List<Widget> widgetList = [buildHouses(), buildDragon(), buildTheory()];

  // Main Function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_black,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu, color: AppColors.royal_gold),
          ),
        ),

        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        title: Text(
          titles[myIndex],
          style: TextStyle(
            fontFamily: 'GameOfThrones',
            fontSize: 18,
            color: AppColors.royal_gold,
          ),
        ),
        centerTitle: false,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.deep_black,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.deep_black),
              child: Container(
                child: Image.asset(
                  "assets/images/stark.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.map_outlined,
                    color: AppColors.royal_gold,
                  ),
                  title: Text(
                    "Game Of Thrones Map",
                    style: TextStyle(
                      color: AppColors.royal_gold,
                      fontFamily: 'GameOfThrones',
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => gotMap()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.map_rounded, color: AppColors.royal_gold),
                  title: Text(
                    "House Of The Dragons Map",
                    style: TextStyle(
                      color: AppColors.royal_gold,
                      fontFamily: 'GameOfThrones',
                      fontSize: 10,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => hodMap()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.home, color: AppColors.royal_gold),
                  title: Text(
                    "Houses Family Tree",
                    style: TextStyle(
                      color: AppColors.royal_gold,
                      fontFamily: 'GameOfThrones',
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => familytree()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share, color: AppColors.royal_gold),
                  title: Text(
                    "Share",
                    style: TextStyle(
                      color: AppColors.royal_gold,
                      fontFamily: 'GameOfThrones',
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    Share.share(
                      '📱 Download Game of Thrones - Houses and Dragons!\nhttps://play.google.com/store/apps/details?id=com.yourcompany.got_app',
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: AppColors.royal_gold),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(
                      color: AppColors.royal_gold,
                      fontFamily: 'GameOfThrones',
                      fontSize: 12,
                    ),
                  ),
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: AppColors.deep_black,
                      title: Text(
                        "SignOut",
                        style: TextStyle(color: AppColors.textWhite),
                      ),
                      content: Text(
                        "Do You Want to Signout ?",
                        style: TextStyle(color: AppColors.textWhite),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(color: AppColors.royal_gold),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Yas",
                            style: TextStyle(color: AppColors.royal_gold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: AppColors.royal_gold),
            label: "Houses",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/dragon.png',
              width: 24,
              height: 24,
              color: AppColors.royal_gold,
            ),
            label: "Dragons",
          ),
          BottomNavigationBarItem(
            icon:  Image.asset(
              'assets/icons/crown.png',
              width: 24,
              height: 24,
              color: AppColors.royal_gold,
            ),
            label: "Legends",
          ),
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

// Dragons Page

class Dragons {
  final String name;
  final String imgurl;
  final String description;

  Dragons({
    required this.name,
    required this.imgurl,
    required this.description,
  });
}

Future<List<Dragons>> loadDragonsFromXml() async {
  final xmlString = await rootBundle.loadString('assets/data/dragons.xml');
  final document = XmlDocument.parse(xmlString);

  final items = document.findAllElements('item');
  return items.map((node) {
    final name = node.findElements('name').single.text;
    final image = node.findElements('image').single.text;
    final description = node.findElements('description').single.text;
    return Dragons(name: name, imgurl: image, description: description);
  }).toList();
}

Widget buildDragon() {
  return FutureBuilder<List<Dragons>>(
    future: loadDragonsFromXml(),
    builder: (context, snapshot) {
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

// Theories Page
class Legends {
  final String name;
  final String imgurl;
  final String description;

  Legends({
    required this.name,
    required this.imgurl,
    required this.description,
  });
}

Future<List<Legends>> loadLegendsFromXml() async {
  final xmlString = await rootBundle.loadString('assets/data/legends.xml');
  final documnet = XmlDocument.parse(xmlString);

  final items = documnet.findAllElements('item');
  return items.map((node) {
    final name = node.findElements('name').single.text;
    final image = node.findElements('image').single.text;
    final description = node.findElements('description').single.text;
    return Legends(name: name, imgurl: image, description: description);
  }).toList();
}

Widget buildTheory() {
  return FutureBuilder<List<Legends>>(
    future: loadLegendsFromXml(),
    builder: (context, snapshot) {
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
