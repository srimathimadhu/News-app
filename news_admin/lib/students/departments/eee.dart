import 'package:flutter/material.dart';

class EEE_Screen extends StatefulWidget {
  const EEE_Screen({super.key});

  @override
  State<EEE_Screen> createState() => _EEE_ScreenState();
}

class _EEE_ScreenState extends State<EEE_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("EEE"),
      ),
    );
  }
}
