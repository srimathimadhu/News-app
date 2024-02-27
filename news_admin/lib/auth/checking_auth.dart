import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_admin/auth/login.dart';
import '../admin/IT/it_post.dart';
import '../students/bottom_navigation.dart';

class Checking_Auth extends StatefulWidget {
  const Checking_Auth({super.key});

  @override
  State<Checking_Auth> createState() => _Checking_AuthState();
}

class _Checking_AuthState extends State<Checking_Auth> {
  @override
  @override
  Widget build(BuildContext context) {
    void route() {
      User? user = FirebaseAuth.instance.currentUser;
      var kk = FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          if (documentSnapshot.get('role') == "Admin") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => IT_post(),
              ),
            );
          } else if (documentSnapshot.get('role') == "student") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => bot_nav_bar(),
              ),
            );
          }
        } else {
          print('Document does not exist on the database');
        }
      });
    }

    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Login_Screen();
              } else {
                return bot_nav_bar();
              }
            }));
  }
}
