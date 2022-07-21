// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vendor_management_webapp/orderclass1.dart';
import 'dart:convert';

import 'package:vendor_management_webapp/ordersclass.dart';

class ViewOrder extends StatefulWidget {
  const ViewOrder({Key? key}) : super(key: key);

  @override
  State<ViewOrder> createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  String orderid = "";
  List<Orders1> orderjson = [];
  Future<List<Orders1>> vieworder() async {
    var url = Uri.parse('http://localhost:4000/orderdb/orderdb');
    var response = await http.get(url);
    var orderrecords = json.decode(response.body);
    for (var u in orderrecords) {
      Orders1 or = Orders1(u["orderid"], u["custid"], u["vendorid"],
          u["details"], u["totalprice"], u["ordertype"], u["isReceived"]);

      orderjson.add(or);
    }
    int lengthct = orderjson.length;
    print(lengthct);
    setState(() {
      orderjson;
    });
    return orderjson;
  }

  @override
  void initState() {
    super.initState();
    vieworder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SafeArea(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 246, 217, 111),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Orders",
                  style: TextStyle(
                      fontFamily: "WorkSans",
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 70,
                ),
                DataTable(
                    columns: [
                      DataColumn(
                          label: Text(
                        "Order ID",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Customer ID",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Vendor ID",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Order Details",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Total Price",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Status",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ))
                    ],
                    rows: orderjson
                        .map<DataRow>((e) => DataRow(cells: [
                              DataCell(
                                Text(e.orderid.toString()),
                                onTap: () {
                                  setState(() {
                                    orderid = e.orderid.toString();
                                  });
                                },
                              ),
                              DataCell(Text(e.custid.toString())),
                              DataCell(Text(e.vendorid.toString())),
                              DataCell(Text(e.details.toString())),
                              DataCell(Text(e.totalprice.toString())),
                              DataCell(Text(e.isReceived.toString()))
                            ]))
                        .toList()),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
