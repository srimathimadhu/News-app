// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                image: NetworkImage(
                    "https://wallpapercave.com/wp/wp4063163.jpg"))),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Column(
                    children: [
                      SizedBox(height: height * 0.17),
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                            "https://th.bing.com/th/id/OIP.Ydskl79qHqlomXnY7YFc1wHaHa?pid=ImgDet&w=1000&h=1000&rs=1"),
                      ),
                      SizedBox(height: height * 0.03),
                      Text(
                        "Srimathi D",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height * 0.001),
                      Text(
                        "2021193",
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    height: height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Information",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Department",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey)),
                                    Text("Information Technology",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Email",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey)),
                                    Text("srimathsrimathi3@gmail.com",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phone No",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey)),
                                    Text("1234567890",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ],
                                ),
                              ]),
                          Center(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ]))));
  }
}
