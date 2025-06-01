import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  final user = FirebaseAuth.instance.currentUser;

  signout()async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Center(
        child:
        Text('${user?.email!}'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (() => signout()),child: Icon(Icons.login_rounded),),
    );
  }
}
