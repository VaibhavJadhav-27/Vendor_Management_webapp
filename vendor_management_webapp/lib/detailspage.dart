// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Detailspage extends StatefulWidget {
  final String profile;
  final String itemname;
  final int itemid;
  final String price;
  final String category;
  final String mquantity;
  final int vendorid;
  final String itemimage;
  Detailspage(
      {Key? key,
      required this.profile,
      required this.itemname,
      required this.itemid,
      required this.price,
      required this.category,
      required this.mquantity,
      required this.vendorid,
      required this.itemimage})
      : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
