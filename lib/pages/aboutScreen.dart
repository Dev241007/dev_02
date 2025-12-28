import 'package:dev_02/pages/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Aboutscreen extends StatefulWidget {
  const Aboutscreen({super.key});

  @override
  State<Aboutscreen> createState() => _AboutscreenState();
}

class _AboutscreenState extends State<Aboutscreen> {

  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref('about_app/description');

  String? description;
  @override
  void initState() {
    super.initState();
    fetchdescription();
  }
  void fetchdescription() async {
    DatabaseEvent event = await databaseReference.once();
    final data = event.snapshot.value as String?;
    if (data != null) {
      setState(() {
        description = data;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark_black,
      appBar: AppBar(
        title: Text("About",style: TextStyle(color: AppColors.royal_gold,fontFamily: "GameOfThrones",fontSize: 17),),
        backgroundColor: AppColors.dark_black,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: AppColors.royal_gold,)),
      ),
      body: description == null
          ? Center(child: CircularProgressIndicator(color: AppColors.royal_gold))
          : Padding(
        padding: const EdgeInsets.only(bottom: 40,right: 10,left: 10,top: 10),
        child: SingleChildScrollView(
          child: Text(
            description!,
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Sora',
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
