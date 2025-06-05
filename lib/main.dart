import 'package:dev_02/pages/Task1.dart';
import 'package:dev_02/pages/HousesPage.dart';
import 'package:dev_02/pages/forgate.dart';
import 'package:dev_02/pages/login.dart';
import 'package:dev_02/pages/siUp.dart';
import 'package:dev_02/pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/SplshScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'ImSc'),
      home: Splshscreen(),
    );
  }
}
