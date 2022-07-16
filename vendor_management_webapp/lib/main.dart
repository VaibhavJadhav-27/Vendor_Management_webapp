// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:vendor_management_webapp/homepage.dart';
import 'package:vendor_management_webapp/loginpage.dart';
import 'package:vendor_management_webapp/registerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(
          profile: "vaibhav",
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
