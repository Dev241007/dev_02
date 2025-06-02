import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFFDF5FF),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: Text('Layout Design By Devendra'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 50,
                    color: Colors.cyan,
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 150,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.brown,
                      ),
                      SizedBox(height: 10),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.brown,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 120,
                    width: 50,
                    color: Colors.greenAccent,
                  ),
                ],
              ),

              SizedBox(height: 20),

              Container(
                height: 40,
                width: double.infinity,
                color: Colors.lightGreen,
              ),

              SizedBox(height: 10),

              Container(
                height: 40,
                width: double.infinity,
                color: Colors.lightGreen,
              ),

              SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        color: Colors.red,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 100,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 40,
                        color: Colors.teal,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 70,
                        width: 40,
                        color: Colors.teal,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 120,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        width: 120,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 60,
                        color: Colors.black,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 70,
                        width: 60,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}