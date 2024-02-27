// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_admin/students/home_screen.dart';
import 'package:news_admin/students/profile_screen.dart';
import 'package:news_admin/students/search_screen.dart';
import 'package:news_admin/widgets/loading.dart';

class bot_nav_bar extends StatefulWidget {
  const bot_nav_bar({super.key});

  @override
  State<bot_nav_bar> createState() => _bot_nav_barState();
}

class _bot_nav_barState extends State<bot_nav_bar> {
  bool loading = false;
  int pageindex = 0;
  final _pages = [home_page(), search_page(), profile_page()];

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: _pages[pageindex],
            bottomNavigationBar: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.height * 0.03,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              pageindex = 0;
                            });
                          },
                          icon: pageindex == 0
                              ? Icon(Iconsax.home,
                                  color: Color.fromARGB(255, 25, 73, 178))
                              : Icon(
                                  Iconsax.home,
                                  color: Colors.grey,
                                )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              pageindex = 1;
                            });
                          },
                          icon: pageindex == 1
                              ? Icon(Iconsax.search_normal,
                                  color: Color.fromARGB(255, 25, 73, 178))
                              : Icon(
                                  Iconsax.search_normal,
                                  color: Colors.grey,
                                )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              pageindex = 2;
                            });
                          },
                          icon: pageindex == 2
                              ? Icon(Iconsax.user,
                                  color: Color.fromARGB(255, 25, 73, 178))
                              : Icon(
                                  Iconsax.user,
                                  color: Colors.grey,
                                ))
                    ])));
  }
}
