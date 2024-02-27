// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news/screens/forgot_screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
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
                        Text("Login Your Account",
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
                            height: MediaQuery.of(context).size.height * 0.02),
                        TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                prefixIcon: Icon(Iconsax.lock),
                                labelText: "Password",
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
                                      Text("Login",
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Forgot_Screen()));
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ]))),
        ));
  }
}
