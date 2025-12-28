import 'package:dev_02/pages/colors.dart';
import 'package:dev_02/pages/login.dart';
import 'package:dev_02/pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController pageController = PageController();
  int currentindex = 0;
  final List<Widget> screens = [Screen1(), Screen2(), Screen3(), Screen4()];

  void nextpage() {
    if (currentindex < screens.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark_black,

      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: screens.length,
            onPageChanged: (index) {
              setState(() {
                currentindex = index;
              });
            },
            itemBuilder: (context, index) => screens[index],
          ),
          Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: screens.length,
                effect: WormEffect(dotHeight: 13,dotWidth: 13,activeDotColor: AppColors.error),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 70,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  nextpage();
                },
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    color: AppColors.error,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      currentindex == screens.length - 1 ? "Enter" : "Next",
                      style: TextStyle(
                        fontFamily: "GameOfThrones",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.dark_black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@override
Widget Screen1() {
  return Column(
    children: [
      SizedBox(height: 80),
      Flexible(child: Image.asset("assets/images/screen1.png", height: 150)),
      SizedBox(height: 15),
      Text(
        "Enter  the  Realm \n of  Ice  and  Fire",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "GameOfThrones",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.error,
        ),
      ),
      SizedBox(height: 25),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Explore the epic world of Game of Thrones and House of the Dragon. Uncover the history, lore, houses, and legends of Westeros and beyond.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Sora",
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ),
      Flexible(child: Image.asset("assets/images/iron.png", height: 350)),
    ],
  );
}

@override
Widget Screen2() {
  return Column(
    children: [
      SizedBox(height: 150),
      Flexible(child: Image.asset("assets/images/house.png", height: 300)),
      SizedBox(height: 30),
      Text(
        "Explore  The  Realm",
        style: TextStyle(
          fontFamily: "GameOfThrones",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.error,
        ),
      ),
      SizedBox(height: 25),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Flexible(
          child: Text(
            "Explore the noble Houses of Westeros. Discover sigils, words, histories, and bloodlines of the great families that rule the realm.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Sora",
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    ],
  );
}

@override
Widget Screen3() {
  return Column(
    children: [
      SizedBox(height: 150),
      Image.asset("assets/images/dragon.png", height: 300),
      SizedBox(height: 20),
      Text(
        "Legends  Come  Alive",
        style: TextStyle(
          fontFamily: "GameOfThrones",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.error,
        ),
      ),
      SizedBox(height: 25),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Read about the legendary dragons of Valyria and Westeros,explore the beasts that shaped history",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Sora",
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ),
    ],
  );
}

@override
Widget Screen4() {
  return Column(
    children: [
      SizedBox(height: 170),
      Image.asset("assets/images/person.png", height: 280),
      SizedBox(height: 10),
      Text(
        "Character  Information",
        style: TextStyle(
          fontFamily: "GameOfThrones",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.error,
        ),
      ),
      SizedBox(height: 25),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Discover detailed profiles of all the iconic characters,Learn about their backgrounds,roles,and key events.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Sora",
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ),
    ],
  );
}
