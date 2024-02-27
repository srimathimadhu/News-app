import 'package:flutter/material.dart';

class MECHATRONICS_Screen extends StatefulWidget {
  const MECHATRONICS_Screen({super.key});

  @override
  State<MECHATRONICS_Screen> createState() => _MECHATRONICS_ScreenState();
}

class _MECHATRONICS_ScreenState extends State<MECHATRONICS_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("MECHATRONICS"),
      ),
    );
  }
}
