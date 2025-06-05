import 'dart:async';

import 'package:dev_02/pages/colors.dart';
import 'package:dev_02/pages/login.dart';
import 'package:dev_02/pages/wrapper.dart';
import 'package:flutter/material.dart';

class Splshscreen extends StatefulWidget {
  const Splshscreen({super.key});

  @override
  State<Splshscreen> createState() => _SplshscreenState();
}

class _SplshscreenState extends State<Splshscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrapper()),);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/stark.jpg',height: 350,),
Text("Game Of Thrones",style: TextStyle(color: AppColors.royal_gold,fontSize: 20,fontFamily: 'GameOfThrones'),),
            SizedBox(height: 10,),
            Text("Houses And Dragons",style: TextStyle(color: AppColors.royal_gold,fontSize: 10,fontFamily: 'GameOfThrones'),)
          ],
        ),
      ),
    );
  }
}
