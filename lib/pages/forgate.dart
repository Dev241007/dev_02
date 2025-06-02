import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dev_02/pages/colors.dart';
import 'package:lottie/lottie.dart';


class forgate extends StatefulWidget {
  const forgate({super.key});

  @override
  State<forgate> createState() => _forgateState();
}

class _forgateState extends State<forgate> {
  TextEditingController email = TextEditingController();
  reset()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.deep_black,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                  'assets/animations/animation-1.json',
                  height: 250,
              ),
              Text("Send a Raven"
                , style:
                TextStyle(
                  fontSize: 35,
                  color: AppColors.royal_gold,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
          
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
                          labelText:"Raven’s Address",
                          labelStyle: TextStyle(color: AppColors.textSecondary),
                          hintText: "Enter Your Raven’s Address",
                          hintStyle: TextStyle(color: AppColors.textSecondary),
                          prefixIcon: Icon(Icons.email,color: AppColors.royal_gold),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: AppColors.royal_gold)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: AppColors.textSecondary)
                          )
                        ),
                        onChanged: (String value ) {
                        },// use to store your email id in this field
                        validator: (value){
                          return value!.isEmpty ? "Please Enter Email " : null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
          
                ],
              ),
          
          
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                    minWidth: 300,
                    height: 45,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onPressed:  (()=>reset()),
                    child: Text("Send Reven"),
                    color: AppColors.royal_gold,
                    textColor: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
