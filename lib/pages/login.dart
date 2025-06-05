import 'package:dev_02/pages/forgate.dart';
import 'package:dev_02/pages/siUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dev_02/pages/colors.dart';
import 'package:lottie/lottie.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.deep_black,
      body:
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/animation-3.json',
                height: 200
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                child: Text("Enter The  Realm"
                  , style:
                  TextStyle(
                    fontFamily: 'GameOfThrones',
                    fontSize: 25,
                    color: AppColors.royal_gold,
                  ),
                ),
              ),
              Column(
                children: [
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        style: TextStyle(
                          color: AppColors.textWhite
                        ),
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.dark_gray,
                          labelText:"Raven’s Address",
                          labelStyle: TextStyle(color: AppColors.textSecondary),
                          hintText: "Enter Your Raven’s Address",
                          hintStyle: TextStyle(color: AppColors.textSecondary),
                          prefixIcon: Icon(Icons.email,color: AppColors.royal_gold,),
                          // This removes the purple and applies your theme
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.royal_gold),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textSecondary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (String value ) {
                        },// use to store your email id in this field
                        validator: (value){
                          return value!.isEmpty ? "Please Enter  Your Raven’s Address " : null;
                        },
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
                        style: TextStyle(color: AppColors.textWhite),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          filled: true,
                            fillColor: AppColors.dark_gray,
                          labelText:"Sacred Oath",
                          labelStyle: TextStyle(color: AppColors.textSecondary),
                          hintText: "Enter The Sacred Words",
                          hintStyle: TextStyle(color: AppColors.textSecondary),
                          prefixIcon: Icon(Icons.lock,color: AppColors.royal_gold,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.royal_gold),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.textSecondary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (String value ) {
                        },// use to store your email id in this field
                        validator: (value){
                          return value!.isEmpty ? "Please Enter The Sacred Words " : null;
                        },
                      ),
          
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => forgate()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none, // optional: removes border
                          textStyle: const TextStyle(
                            fontFamily: 'GameOfThrones',
                            fontSize: 10,
                          ),
                          foregroundColor: AppColors.textSecondary,
                        ),
                        child: const Text("Send a Raven to recover your words.?"),
                      ),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                  onPressed:  (()=>signIn()),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: AppColors.royal_gold,
                      width: 3.0,
                    ),
                    backgroundColor: AppColors.royal_gold,
                    foregroundColor: AppColors.deep_black,
                    textStyle: const TextStyle(
                      fontFamily: 'GameOfThrones',
                      fontSize: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Enter The Realm"),
                ),
              ),



          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("New to the Realm? Join the Game.? ",style: TextStyle(color: AppColors.royal_gold,fontFamily: 'GameOfThrones',fontSize: 14),),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => siUp()),
              );
            },
            style: OutlinedButton.styleFrom(
              textStyle: TextStyle(fontFamily: 'GameOfThrones',fontSize: 12),
              side: const BorderSide(color: Colors.transparent),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              foregroundColor: AppColors.textSecondary,
            ),
            child: const Text("Join The Game Of Thrones"),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
