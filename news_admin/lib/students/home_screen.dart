// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_admin/students/detail_screen.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('post').snapshots();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 245, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 241, 245, 255),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Headline",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
              Text("Today,februray 23rd",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey)),
            ],
          ),
        ),
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
                            return SingleChildScrollView(
                              child: SafeArea(
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            News_Screen(
                                                                docid: snapshot
                                                                    .data!
                                                                    .docs[i])));
                                              },
                                              child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(
                                                                      data[
                                                                          'post_imageUrl']))),
                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets
                                                                .all(MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.02),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                      data[
                                                                          "title"],
                                                                      style: TextStyle(
                                                                          height:
                                                                              1.5,
                                                                          fontSize:
                                                                              25,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  SizedBox(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.010),
                                                                  Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          data[
                                                                              'dept'],
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.grey),
                                                                        ),
                                                                        Text(
                                                                            "09/03/2023",
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
                                                                      ])
                                                                ]))
                                                      ])),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03),
                                          ]))),
                            );
                          })));
            }));
  }
}
