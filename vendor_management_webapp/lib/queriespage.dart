// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Queriespage extends StatefulWidget {
  final String profile;
  Queriespage({Key? key, required this.profile}) : super(key: key);

  @override
  State<Queriespage> createState() => _QueriespageState();
}

class _QueriespageState extends State<Queriespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.lightGreenAccent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.55,
                child: Center(
                  child: Text("Hekko"),
                ),
              ),
              VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.40,
                child: Center(
                  child: Text("vaibhav"),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
