import 'package:flutter/material.dart';

class TEXTILE_Screen extends StatefulWidget {
  const TEXTILE_Screen({super.key});

  @override
  State<TEXTILE_Screen> createState() => _TEXTILE_ScreenState();
}

class _TEXTILE_ScreenState extends State<TEXTILE_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("TEXTILE"),
      ),
    );
  }
}
