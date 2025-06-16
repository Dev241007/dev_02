import 'package:dev_02/pages/colors.dart';
import 'package:flutter/material.dart';

class Dragonsdetailscreen extends StatelessWidget {
  final String dragonsName;
  final String imageurl;
  final String description;

  const Dragonsdetailscreen({
    super.key,
  required this.dragonsName,
    required this.imageurl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0.0,
          title: Text(dragonsName,style: TextStyle(
            fontFamily: 'GameOfThrones',fontSize: 20,color: AppColors.royal_gold,fontWeight: FontWeight.w800),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: AppColors.royal_gold,),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(imageurl),
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(description,style: TextStyle(fontSize: 19,color: AppColors.textSecondary,fontWeight: FontWeight.w900),
              textAlign: TextAlign.justify,),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}