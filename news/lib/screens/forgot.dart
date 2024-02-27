import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'login_screen.dart';

class forgot_screen extends StatefulWidget {
  const forgot_screen({super.key});

  @override
  State<forgot_screen> createState() => _forgot_screenState();
}

class _forgot_screenState extends State<forgot_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: double.infinity,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: NetworkImage(
              //             "https://media.istockphoto.com/id/1153965495/vector/abstract-square-background.jpg?s=170667a&w=0&k=20&c=EFdKZoBqYFHiaefvEX_WVDz5uiPniT5qquZh_I9VBlA="))),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/ksrct-newsletter.appspot.com/o/assets%2Fksrct%20logo2.png?alt=media&token=d3608149-fd3c-45ba-9130-7f0c0d48dce4"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text("Enter Your Mail ID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Iconsax.sms),
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () {},
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Reset",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))
                                    ]))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Login_Screen()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ]))),
        ));
  }
}
