import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


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
      body:
      Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Forget Password  "
              , style:
              TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 400,
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText:"Email",
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
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
                  minWidth: 100,
                  height: 40,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed:  (()=>reset()),
                  child: Text("Send link"),
                  color: Colors.black,
                  textColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
