// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_admin/widgets/loading.dart';
import 'package:path/path.dart' as Path;

class IT_Add extends StatefulWidget {
  const IT_Add({super.key});

  @override
  State<IT_Add> createState() => _IT_AddState();
}

class _IT_AddState extends State<IT_Add> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  // IT Image Upload
  File? _image_IT;
  final picker_IT = ImagePicker();
  bool loading = false;
  bool visible = false;

  Future pickImage_IT() async {
    final pickedFile = await picker_IT.getImage(source: ImageSource.gallery);

    setState(() {
      _image_IT = File(pickedFile!.path);
    });
  }

  Future uploadImage_IT() async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('IT_Images/${Path.basename(_image_IT!.path)}');
    TaskSnapshot taskSnapshot_IT = await reference.putFile(_image_IT!);
    String image_url = await taskSnapshot_IT.ref
        .getDownloadURL()
        .whenComplete(() => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Upload Successfully",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )));
    print(image_url);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("IT Add"),
            ),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Form(
                            key: _formkey,
                            child: Column(
                                //    mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                          child: _image_IT == null
                                              ? InkWell(
                                                  onTap: pickImage_IT,
                                                  child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              234,
                                                              246,
                                                              255),
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight:
                                                                  Radius.circular(20),
                                                              bottomLeft: Radius.circular(20),
                                                              bottomRight: Radius.circular(20))),
                                                      child: Center(
                                                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                        CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: Icon(Icons
                                                                .upload_file)),
                                                        SizedBox(height: 10),
                                                        Text(
                                                            "Click to select from files ",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .grey))
                                                      ]))))
                                              : MaterialButton(
                                                  onPressed: uploadImage_IT,
                                                  child: Text(
                                                    "Upload",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  color: Colors.blue))),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Text("Title",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  TextFormField(
                                    controller: title,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    validator: (value) {
                                      RegExp regExp = RegExp(r'^.{15,}$');
                                      if (value!.isEmpty) {
                                        return "Title is cannot be empty";
                                      }
                                    },
                                    onSaved: (value) {
                                      title.text = value!;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Text("Description",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  TextFormField(
                                    controller: description,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    validator: (value) {
                                      RegExp regExp = RegExp(r'^.{50,}$');
                                      if (value!.isEmpty) {
                                        return "Description is cannot be empty";
                                      }
                                    },
                                    onSaved: (value) {
                                      title.text = value!;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          color: Colors.blue,
                                          onPressed: () {
                                            setState(() {
                                              visible = true;
                                            });
                                            adduserDetails(
                                              title.text.trim(),
                                              description.text.trim(),
                                            );
                                          },
                                          child: Text("Post",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white))))
                                ]))))));
  }

  //add user detail to firestore
  Future adduserDetails(
    String title,
    String description,
  ) async {
    if (_formkey.currentState!.validate()) {
      setState(() => loading = true);
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('IT_Images/${Path.basename(_image_IT!.path)}');
      TaskSnapshot taskSnapshot_IT = await reference.putFile(_image_IT!);
      String image_url = await taskSnapshot_IT.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection("post").add({
        'title': title,
        'description': description,
        'post_time': FieldValue.serverTimestamp(),
        'dept': 'Information Technology',
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'post_imageUrl': image_url
      }).whenComplete(() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Post Successfully",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              )));
    }
  }
}
