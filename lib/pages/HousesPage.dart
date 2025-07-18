import 'package:dev_02/pages/Map.dart';
import 'package:dev_02/pages/colors.dart';
import 'package:dev_02/pages/housesFamilytree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'Dragons_List.dart';
import 'Houses_List.dart';
import 'Legends_List.dart';

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

  final List<Widget> widgetList = [
    buildHouses(),
    buildDragon(),
    buildLegends(),
  ];

  // Main Function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_black,
      appBar: AppBar(
        leading: Builder(
          builder: (context) =>
              IconButton(
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
              child: Center(
                child: Container(
                  child: Image.asset(
                    "assets/images/header.png",
                    height: 300,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
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
                  leading: Image.asset(
                      "assets/icons/got.png", color: AppColors.royal_gold,
                      height: 29),
                  title: Text(
                    "What's  Got",
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
                        MaterialPageRoute(
                          builder: (context) => FamilyTreeScreen(),
                        )
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
                  onTap: () =>
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            AlertDialog(
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
                                    style: TextStyle(
                                        color: AppColors.royal_gold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Yas",
                                    style: TextStyle(
                                        color: AppColors.royal_gold),
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
              width: 20,
              height: 20,
              color: AppColors.royal_gold,
            ),
            label: "Dragons",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
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
