import 'package:dev_02/pages/login.dart';
import 'package:dev_02/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dev_02/pages/colors.dart';
import 'package:lottie/lottie.dart';

class siUp extends StatefulWidget {
  const siUp({super.key});

  @override
  State<siUp> createState() => _siUpState();
}

class _siUpState extends State<siUp> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? errorMessage; // <-- Add this

  signup() async {
    final emailText = email.text.trim();
    final passwordText = password.text.trim();

    final allowedDomains = ['gmail.com', 'yahoo.com', 'outlook.com', 'hotmail.com'];

    String domain = emailText.split('@').last;

    if (!allowedDomains.contains(domain)) {
      setState(() {
        errorMessage = 'Please use a valid email provider like Gmail or Yahoo.';
      });
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );
      Get.offAll(Wrapper());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          errorMessage = 'User already exists. Please try logging in.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon : Icon(Icons.arrow_back,color: AppColors.royal_gold,size: 25,),
          onPressed: () {
            navigator?.pop(context);
          },
        ),
      ),
      backgroundColor: AppColors.deep_black,
      body:
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                  'assets/animations/animation-2.json',
                  height: 200
              ),
              SizedBox(height: 20,),
              Text("Join  The  Game ",style:
              TextStyle(
                  fontSize: 28,
                  fontFamily: 'GameOfThrones',
                  color: AppColors.royal_gold,
              ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 350,
                  child: TextFormField(
                    style: TextStyle(color: AppColors.textWhite),
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                        fillColor: AppColors.dark_gray,
                        label: Text("Raven’s Address"),
                        labelStyle: TextStyle(color: AppColors.textSecondary),
                        hintText: "Enter Your Raven’s Address",
                        hintStyle: TextStyle(color: AppColors.textSecondary),
                        prefixIcon: Icon(Icons.email,color: AppColors.royal_gold,),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color:AppColors.royal_gold)
                        ),
                        enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.textSecondary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                    ),
          
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 350,
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.dark_gray,
                        label: Text("Sacred Oath"),
                        labelStyle: TextStyle(color: AppColors.textSecondary),
                        hintText: "Enter The Sacred Words",
                        hintStyle: TextStyle(color: AppColors.textSecondary),
                        prefixIcon: Icon(Icons.password,color: AppColors.royal_gold,),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color:AppColors.royal_gold)
                        ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.textSecondary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
          
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: OutlinedButton(onPressed: (() => signup()),
                    style:
                    OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppColors.royal_gold,
                        width: 4.0,
                      ),
                      backgroundColor: AppColors.royal_gold,
                      foregroundColor: AppColors.deep_black,
                      textStyle: TextStyle(
                        fontFamily: 'GameOfThrones',
                        fontSize: 15
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    child: Text("Join The Realm"))
              ),
          SizedBox(height: 15,),
              Text("Already pledged ?",style: TextStyle(color: AppColors.royal_gold,fontFamily: 'GameOfThrones',fontSize: 14)),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                  },
                  style: OutlinedButton.styleFrom(
                    textStyle: TextStyle(fontFamily: 'GameOfThrones',fontSize: 12),
                    minimumSize: const Size(50, 40),
                    backgroundColor: Colors.transparent, // transparent background
                    side: BorderSide(
                      color: Colors.transparent, // outline color
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: AppColors.textSecondary, // text color
                    elevation: 0,
                  ),
                  child: const Text('Enter the gates'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
