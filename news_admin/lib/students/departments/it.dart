// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_admin/students/detail_screen.dart';

class IT_Screen extends StatefulWidget {
  const IT_Screen({super.key});

  @override
  State<IT_Screen> createState() => _IT_ScreenState();
}

class _IT_ScreenState extends State<IT_Screen> {
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance
      .collection('post')
      .where('dept', isEqualTo: 'Information Technology')
      .snapshots();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 245, 255),
        body: StreamBuilder(
            stream: _userStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, i) {
                            var data = snapshot.data!.docs[i];
                            return Column(children: [
                              Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.04),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => News_Screen(
                                                  docid:
                                                      snapshot.data!.docs[i])));
                                    },
                                    child: Container(
                                        height: 100,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(children: [
                                          Container(
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        data['post_imageUrl'],
                                                      )))),
                                          Expanded(
                                              child: Padding(
                                                  padding: EdgeInsets.all(
                                                      width * 0.02),
                                                  child: Text(data['title'],
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold))))
                                        ])),
                                  ))
                            ]);
                          })));
            }));
  }
}
