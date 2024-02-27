// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news/screens/departments/ai&ds.dart';
import 'package:news/screens/departments/biotech.dart';
import 'package:news/screens/departments/civil.dart';
import 'package:news/screens/departments/cs.dart';
import 'package:news/screens/departments/csbs.dart';
import 'package:news/screens/departments/ece.dart';
import 'package:news/screens/departments/eee.dart';
import 'package:news/screens/departments/foodtech.dart';
import 'package:news/screens/departments/it.dart';
import 'package:news/screens/departments/mechanical.dart';
import 'package:news/screens/departments/mechatronics.dart';
import 'package:news/screens/departments/textile.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text("Departments",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "IT"),
                  Tab(text: "CSE"),
                  Tab(text: "ECE"),
                  Tab(text: "EEE"),
                  Tab(text: "CIVIL"),
                  Tab(text: "MECH"),
                  Tab(text: "MECHATRONICS"),
                  Tab(text: "AIDS"),
                  Tab(text: "TEXTILE"),
                  Tab(text: " BIOTECH"),
                  Tab(text: "FOODTECH"),
                  Tab(text: "CSBS")
                ])),
        backgroundColor: Color.fromARGB(255, 241, 245, 255),
        body: TabBarView(children: [
          IT_Screen(),
          CSE_Screen(),
          ECE_Screen(),
          EEE_Screen(),
          CIVIL_Screen(),
          MECHANICAL_Screen(),
          MECHATRONICS_Screen(),
          AIDS_Screen(),
          TEXTILE_Screen(),
          BIOTECH_Screen(),
          FOODTECH_Screen(),
          CSBS_Screen(),
        ]),
      ),
    );
  }
}
