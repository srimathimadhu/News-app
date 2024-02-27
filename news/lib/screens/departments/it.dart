// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class IT_Screen extends StatefulWidget {
  const IT_Screen({super.key});

  @override
  State<IT_Screen> createState() => _IT_ScreenState();
}

class _IT_ScreenState extends State<IT_Screen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 245, 255),
        body: Column(children: [
          Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Container(
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.Rw-Ax6KKOanXl74v7KBo7wHaEv?w=289&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7")))),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(width * 0.02),
                            child: Text(
                                "Miss Madhu promoted to HOD of Informationn Technology Departments",
                                style: TextStyle(fontWeight: FontWeight.bold))))
                  ])))
        ]));
  }
}
