// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vendor_management_webapp/query1class.dart';

class ViewQuery extends StatefulWidget {
  const ViewQuery({Key? key}) : super(key: key);

  @override
  State<ViewQuery> createState() => _ViewQueryState();
}

class _ViewQueryState extends State<ViewQuery> {
  String queryid = "";
  List<Query1> queryjson = [];
  Future<List<Query1>> viewquery() async {
    var url = Uri.parse('http://localhost:4000/queries/queries');
    var response = await http.get(url);
    var queryrecords = json.decode(response.body);
    for (var u in queryrecords) {
      Query1 qy = Query1(u["queryid"], u["vendorid"], u["querydetails"],
          u["qtime"], u["status"]);
      queryjson.add(qy);
    }
    int lengthct = queryrecords.length;
    print(lengthct);
    setState(() {
      queryjson;
    });
    return queryjson;
  }

  @override
  void initState() {
    super.initState();
    viewquery();
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
                        "Query ID",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Vendor ID",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Query Details",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Query Time",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        "Status",
                        style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                    rows: queryjson
                        .map((e) => DataRow(cells: [
                              DataCell(
                                Text(e.queryid.toString()),
                                onTap: () {
                                  setState(() {
                                    queryid = e.queryid.toString();
                                  });
                                },
                              ),
                              DataCell(Text(e.vendorid.toString())),
                              DataCell(Text(e.querydetails.toString())),
                              DataCell(Text(e.qtime.toString())),
                              DataCell(Text(e.status.toString())),
                            ]))
                        .toList())
              ],
            ),
          )),
        ),
      ),
    );
  }
}
