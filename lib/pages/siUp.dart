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
    bool isValidEmail(String email) {
      // Basic regex for email validation
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return emailRegex.hasMatch(email);
    }
    if (!isValidEmail(emailText)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid email address",style: TextStyle(color: AppColors.error,fontFamily: 'Sora',fontSize: 15),),backgroundColor: AppColors.deep_black,),
      );
      return;
    }
    if ( passwordText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter Password",style:TextStyle(color: AppColors.error,fontFamily: 'Sora',fontSize: 15),),backgroundColor: AppColors.deep_black,),
      );
      return;
    }
    if ( passwordText.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" Password At Least 6 character",style:TextStyle(color: AppColors.error,fontFamily: 'Sora',fontSize: 15),),backgroundColor: AppColors.deep_black,),
      );
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );
      Get.offAll(Wrapper());
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'That email is already registered.';
      break;
        case 'invalid-email':
          message = 'The email address is invalid.';

      break;
        case 'weak-password':
          message = 'The password is too weak.';

          break;
        default:
          message = e.message ?? 'Registration failed.';

          }
      print(message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message,style: TextStyle(color: AppColors.royal_gold,fontFamily: "Sora"),),backgroundColor: AppColors.deep_black,),
      );
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
                      cursorColor: AppColors.textSecondary,
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
                    style: TextStyle(color: AppColors.textSecondary),
                    cursorColor: AppColors.textSecondary,
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
