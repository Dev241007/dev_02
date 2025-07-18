import 'package:dev_02/pages/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FamilyTree extends StatelessWidget {
  final String Name;
  final String TreeImage;

  FamilyTree({super.key, required this.Name, required this.TreeImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Name,
          style: TextStyle(
            fontFamily: 'GameOfThrones',
            fontSize: 20,
            color: AppColors.royal_gold,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.royal_gold),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          maxScale: 3,
          child: Image.network(
            TreeImage,
            loadingBuilder: (context, child, loadingpprogress) {
              if (loadingpprogress == null) return child;
              return Center(
                child: CircularProgressIndicator(color: AppColors.royal_gold),
              );
            },
            height: 900,
          ),
        ),
      ),
    );
  }
}
