import 'package:flutter/material.dart';

class BIOTECH_Screen extends StatefulWidget {
  const BIOTECH_Screen({super.key});

  @override
  State<BIOTECH_Screen> createState() => _BIOTECH_ScreenState();
}

class _BIOTECH_ScreenState extends State<BIOTECH_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text(" BIOTECH"),
      ),
    );
  }
}
