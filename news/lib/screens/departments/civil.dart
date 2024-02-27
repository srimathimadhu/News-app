import 'package:flutter/material.dart';

class CIVIL_Screen extends StatefulWidget {
  const CIVIL_Screen({super.key});

  @override
  State<CIVIL_Screen> createState() => _CIVIL_ScreenState();
}

class _CIVIL_ScreenState extends State<CIVIL_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("CIVIL"),
      ),
    );
  }
}
