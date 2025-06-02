import 'package:dev_02/pages/HousesPage.dart';
import 'package:flutter/material.dart';

class Housedetailscreen extends StatelessWidget {
  final String houseName;
  final String imageUrl;
  final String description;

  const Housedetailscreen({
    super.key,
    required this.houseName,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(houseName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                houseName,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}