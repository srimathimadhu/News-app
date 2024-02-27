import 'package:flutter/material.dart';

class MECHANICAL_Screen extends StatefulWidget {
  const MECHANICAL_Screen({super.key});

  @override
  State<MECHANICAL_Screen> createState() => _MECHANICAL_ScreenState();
}

class _MECHANICAL_ScreenState extends State<MECHANICAL_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("MECHANICAL"),
      ),
    );
  }
}
