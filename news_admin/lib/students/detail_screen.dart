import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class News_Screen extends StatelessWidget {
  DocumentSnapshot docid;
  News_Screen({required this.docid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Iconsax.arrow_left, color: Colors.black)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.share, color: Colors.black))
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(docid.get('post_imageUrl')),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(docid.get('title'),
                  style: TextStyle(
                      height: 1.5, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(docid.get('dept'),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(docid.get('description'),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
