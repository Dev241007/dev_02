import 'package:dev_02/pages/forgate.dart';
import 'package:dev_02/pages/siUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      body:
      Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login "
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 400,
                    child: TextFormField(
                      controller: password,
                      maxLength: 8,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText:"Password",
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      onChanged: (String value ) {
                      },// use to store your email id in this field
                      validator: (value){
                        return value!.isEmpty ? "Please Enter Password " : null;
                      },
                    ),
                    
                  ),
                ),
              ],
            ),

  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Row(
          children: [
            Container(
              child:
              Text("Forget Password ?"),

            ),
          MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => forgate()));
          }, child:
          Text("Click Here"),
            mouseCursor: SystemMouseCursors.click,
          elevation: 0.0,

          textColor: Colors.blue,)
          ],
        ),
      ),



            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                  minWidth: 100,
                  height: 40,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed:  (()=>signIn()),
                  child: Text('Login'),
                  color: Colors.black,
                  textColor: Colors.white),
            ),


            Text("Don't Have Any Account ? "),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  minWidth: 100,
                  height: 40,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => siUp() ));
                  },
                  child: Text('Sign Up'),
                  color: Colors.transparent,
                  elevation: 0.0,
                  textColor: Colors.blue),
            ),
          ],

        ),

      ),
    );
  }
}
