import 'package:dev_02/pages/Ui/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class gotMap extends StatefulWidget {
  const gotMap({super.key});

  @override
  State<gotMap> createState() => _gotMapState();
}

class _gotMapState extends State<gotMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.royal_gold),
        ),
        title: Text(
          "Game  Of  Thrones  Map",
          style: TextStyle(
            fontFamily: 'GameOfThrones',
            fontSize: 18,
            color: AppColors.royal_gold,
          ),
        ),
      ),
      body: InteractiveViewer(
        maxScale: 10.00,
        child: Image.network(
          "https://res.cloudinary.com/dehg4gzik/image/upload/v1751389989/Got_rylvv2.jpg",
          loadingBuilder: (context, child, loadingprogress) {
            if (loadingprogress == null) return child;
            return Center(
              child: CircularProgressIndicator(color: AppColors.royal_gold),
            );
          },
          height: 800,
        ),
      ),
    );
  }
}

class hodMap extends StatefulWidget {
  const hodMap({super.key});

  @override
  State<hodMap> createState() => _hodMapState();
}

class _hodMapState extends State<hodMap> {
  final DatabaseReference dbref = FirebaseDatabase.instance.ref().child(
    'about_got/description',
  );

  String? gotDescription;

  @override
  void initState() {
    super.initState();
    fetchdescription();
  }

  void fetchdescription() async {
    DatabaseEvent event = await dbref.once();
    final data = event.snapshot.value as String?;
    if (data != null) {
      setState(() {
        gotDescription = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.royal_gold),
        ),
        title: Text(
          "What's  Got  ",
          style: TextStyle(
            fontFamily: 'GameOfThrones',
            fontSize: 16,
            color: AppColors.royal_gold,
          ),
        ),
      ),
      body: gotDescription == null
          ? Center(child: CircularProgressIndicator(color: AppColors.royal_gold))
      : Padding(
        padding: const EdgeInsets.only(bottom: 40,right: 10,left: 10,top: 10),
        child: SingleChildScrollView(
          child: Text(
            gotDescription!,
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
