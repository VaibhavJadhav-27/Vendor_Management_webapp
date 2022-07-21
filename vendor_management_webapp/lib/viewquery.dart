// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewQuery extends StatefulWidget {
  const ViewQuery({Key? key}) : super(key: key);

  @override
  State<ViewQuery> createState() => _ViewQueryState();
}

class _ViewQueryState extends State<ViewQuery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 246, 217, 111),
        )),
      ),
    );
  }
}
