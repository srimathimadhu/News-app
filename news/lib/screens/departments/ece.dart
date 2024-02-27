import 'package:flutter/material.dart';

class ECE_Screen extends StatefulWidget {
  const ECE_Screen({super.key});

  @override
  State<ECE_Screen> createState() => _ECE_ScreenState();
}

class _ECE_ScreenState extends State<ECE_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("ECE"),
      ),
    );
  }
}
