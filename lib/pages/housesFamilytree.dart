import 'package:flutter/material.dart';

import 'colors.dart';

class familytree extends StatefulWidget {
  const familytree({super.key});

  @override
  State<familytree> createState() => _familytreeState();
}

class _familytreeState extends State<familytree> {
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
    );
  }
}
