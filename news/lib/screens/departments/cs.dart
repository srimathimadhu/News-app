import 'package:flutter/material.dart';

class CSE_Screen extends StatefulWidget {
  const CSE_Screen({super.key});

  @override
  State<CSE_Screen> createState() => _CSE_ScreenState();
}

class _CSE_ScreenState extends State<CSE_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("CSE"),
      ),
    );
  }
}
