import 'package:flutter/material.dart';

class FOODTECH_Screen extends StatefulWidget {
  const FOODTECH_Screen({super.key});

  @override
  State<FOODTECH_Screen> createState() => _FOODTECH_ScreenState();
}

class _FOODTECH_ScreenState extends State<FOODTECH_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("FOODTECH"),
      ),
    );
  }
}
