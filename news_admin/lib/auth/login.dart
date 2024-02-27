import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_admin/auth/forgot.dart';
import 'package:news_admin/students/bottom_navigation.dart';
import 'package:news_admin/widgets/loading.dart';

import '../admin/IT/it_edit.dart';
import '../admin/IT/it_post.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool _isObscure3 = true;
  bool visible = false;
  bool loading = false;

  // login

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      setState(() => loading = true);
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("User Not Found"),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_Screen()));
                        },
                        child: Text("ok"),
                      )
                    ],
                  ));
        } else if (e.code == 'wrong-password') {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Password Incorrect"),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_Screen()));
                        },
                        child: Text("ok"),
                      )
                    ],
                  ));
        } else {
          CircularProgressIndicator();
        }
      }
    }
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Admin") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => IT_post(),
              ));
        } else if (documentSnapshot.get('role') == "student") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => bot_nav_bar(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1),
                      child: Form(
                        key: _formkey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/ksrct-newsletter.appspot.com/o/assets%2Fksrct%20logo2.png?alt=media&token=d3608149-fd3c-45ba-9130-7f0c0d48dce4"),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Text("Login Your Account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.length == 0) {
                                      return "Email cannot be empty";
                                    }
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Please enter a valid email");
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    emailController.text = value!;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Iconsax.sms),
                                    labelText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  )),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              TextFormField(
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return "Password cannot be empty";
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("please enter valid password min. 6 character");
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    passwordController.text = value!;
                                  },
                                  controller: passwordController,
                                  obscureText: _isObscure3,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          icon: Icon(_isObscure3
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure3 = !_isObscure3;
                                            });
                                          }),
                                      prefixIcon: Icon(Iconsax.lock),
                                      labelText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)))),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)))),
                                      onPressed: () {
                                        setState(() {
                                          visible = true;
                                        });
                                        signIn(emailController.text,
                                            passwordController.text);
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Login",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ]))),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    forgot_screen()));
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ]),
                      ))),
            ));
  }
}
