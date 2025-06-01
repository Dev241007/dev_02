import 'package:dev_02/pages/login.dart';
import 'package:dev_02/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Sign Up ",style:
            TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 400,
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter the Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

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
                width: 400,
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(

                      label: Text("Password"),
                      hintText: "Enter Password",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),

                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                minWidth: 100,
                height: 40,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: (() =>signup()),
                child: Text('Sign Up'),
                color: Colors.black,
                textColor: Colors.white,),
            ),

            Text("Already Have Account ?"),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: MaterialButton(
                minWidth: 100,
                height: 40,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => login() ));
                },
                child: Text('Login '),
                color: Colors.transparent,
                elevation: 0.0,
                textColor: Colors.blue,),
            ),
          ],
        ),
      ),
    );
  }
}
