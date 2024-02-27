import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/ksrct-newsletter.appspot.com/o/assets%2Fksrct%20logo2.png?alt=media&token=d3608149-fd3c-45ba-9130-7f0c0d48dce4"),
          ),
          SizedBox(child: CircularProgressIndicator())
        ])));
  }
}
