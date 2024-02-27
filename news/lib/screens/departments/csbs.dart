import 'package:flutter/material.dart';

class CSBS_Screen extends StatefulWidget {
  const CSBS_Screen({super.key});

  @override
  State<CSBS_Screen> createState() => _CSBS_ScreenState();
}

class _CSBS_ScreenState extends State<CSBS_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      body: Center(
        child: Text("CSBS"),
      ),
    );
  }
}
