// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_import

import 'package:flutter/material.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _email = TextEditingController();
  late TextEditingController _pass = TextEditingController();

  String email = "";
  String pass = "";
  String type = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent,
          child: Center(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: SizedBox(
                height: 650,
                width: 1100,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        width: 600,
                        child: Container(
                          color: Colors.pinkAccent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                Center(
                                    child: Text(
                                  " Account Login ",
                                  style: TextStyle(
                                      fontFamily: "WorkSans",
                                      fontSize: 40,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                    "Welcome back. Please login to your account"),
                                SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Email ID :",
                                    style: TextStyle(
                                        fontFamily: "WorkSans", fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                  width: 400,
                                  child: TextField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                      hintText: "Enter email id....",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Password :",
                                    style: TextStyle(
                                        fontFamily: "WorkSans", fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                  width: 400,
                                  child: TextField(
                                    controller: _pass,
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    decoration: InputDecoration(
                                      hintText: "Enter password....",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Color.fromARGB(255, 21, 2, 1),
                                  thickness: 3,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 10),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontFamily: "WorkSans",
                                                fontSize: 20),
                                          ),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 10),
                                          child: Text(
                                            "Signup",
                                            style: TextStyle(
                                                fontFamily: "WorkSans",
                                                fontSize: 20),
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
