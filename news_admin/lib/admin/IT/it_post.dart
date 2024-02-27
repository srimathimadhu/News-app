import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_admin/admin/IT/it_edit.dart';

import 'package:news_admin/auth/login.dart';
import 'package:news_admin/widgets/loading.dart';

import 'it_add.dart';

class IT_post extends StatefulWidget {
  const IT_post({super.key});

  @override
  State<IT_post> createState() => _IT_postState();
}

class _IT_postState extends State<IT_post> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('post').snapshots();
  bool loading = false;
  signOut() async {
    await FirebaseAuth.instance;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login_Screen()));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return loading
        ? Loading()
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => IT_Add()));
              },
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text("IT Post"),
              actions: [
                IconButton(
                    onPressed: () {
                      signOut();
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            body: StreamBuilder(
                stream: _userStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                              builder: (_) => IT_edit(
                                                  docid:
                                                      snapshot.data!.docs[i])));
                                    },
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 205, 232, 255),
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
                          }),
                    ),
                  );
                }));
  }
}
