// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_admin/students/departments/ai&ds.dart';
import 'package:news_admin/students/departments/biotech.dart';
import 'package:news_admin/students/departments/civil.dart';
import 'package:news_admin/students/departments/cs.dart';
import 'package:news_admin/students/departments/csbs.dart';
import 'package:news_admin/students/departments/ece.dart';
import 'package:news_admin/students/departments/eee.dart';
import 'package:news_admin/students/departments/foodtech.dart';
import 'package:news_admin/students/departments/it.dart';
import 'package:news_admin/students/departments/mechanical.dart';
import 'package:news_admin/students/departments/mechatronics.dart';
import 'package:news_admin/students/departments/textile.dart';

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
