import 'package:flutter/material.dart';

class AIDS_Screen extends StatefulWidget {
  const AIDS_Screen({super.key});

  @override
  State<AIDS_Screen> createState() => _AIDS_ScreenState();
}

class _AIDS_ScreenState extends State<AIDS_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("AIDS"),
      ),
    );
  }
}
