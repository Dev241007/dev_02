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
                child: Text("Enter The Realm"
                  , style:
                  TextStyle(
                    fontSize: 35,
                    color: AppColors.royal_gold,
                    fontWeight: FontWeight.bold,
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
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => forgate()));
              }, child:
              Text("Send a Raven to recover your words.?"),
                mouseCursor: SystemMouseCursors.click,
              elevation: 0.0,
          
              textColor: AppColors.textSecondary,)
              ],
            ),
          ),
                ),
          
          
          
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: MaterialButton(
                    minWidth: 300,
                    height: 45,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onPressed:  (()=>signIn()),
                    child: Text('Unlock the Gates',style: TextStyle(
                      color: Colors.black
                    ),),
                    color: AppColors.royal_gold,
                    textColor: Colors.white),
          
              ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("New to the Realm? Join the Game.? ",style: TextStyle(color: AppColors.royal_gold),),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => siUp()),
              );
            },
            style: OutlinedButton.styleFrom(
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
