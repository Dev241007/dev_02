import 'package:dev_02/pages/colors.dart';
import 'package:flutter/material.dart';

class gotMap extends StatefulWidget {
  const gotMap({super.key});

  @override
  State<gotMap> createState() => _gotMapState();
}

class _gotMapState extends State<gotMap> {
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
          "Game  Of  Thrones  Map",
          style: TextStyle(
            fontFamily: 'GameOfThrones',
            fontSize: 18,
            color: AppColors.royal_gold,
          ),
        ),
      ),
    );
  }
}


class hodMap extends StatefulWidget {
  const hodMap({super.key});

  @override
  State<hodMap> createState() => _hodMapState();
}

class _hodMapState extends State<hodMap> {
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
          "House Of The Dragons Map",
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
