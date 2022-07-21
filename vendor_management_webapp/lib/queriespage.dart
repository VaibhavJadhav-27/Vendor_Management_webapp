// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_final_fields, avoid_print, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vendor_management_webapp/queryclass.dart';

class Queriespage extends StatefulWidget {
  final String profile;
  Queriespage({Key? key, required this.profile}) : super(key: key);

  @override
  State<Queriespage> createState() => _QueriespageState();
}

class _QueriespageState extends State<Queriespage> {
  TextEditingController _topic = TextEditingController();
  TextEditingController _details = TextEditingController();

  String details = "";
  String topic = "";
  String profile1 = "";
  List<Query> queryrecords = [];
  var d;

  @override
  void initState() {
    super.initState();
    d = displayquery();
  }

  void insertquery() async {
    var url1 =
        Uri.parse('http://localhost:4000/vendor/vendor/fname/fname/$profile1');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response1 = await http.get(url1);
    var empjson = json.decode(response1.body.toString());
    var vendorid = empjson[0]["vendorid"];
    print(vendorid);
    String alld = topic + details;
    print(alld);
    var now1 = DateTime.now();
    var ordertime =
        "${now1.year}-${now1.month}-${now1.day} ${now1.hour}:${now1.minute}:${now1.second}";
    var ordertime1 = ordertime;
    print(ordertime);
    print(ordertime1);
    var url2 = Uri.parse('http://localhost:4000/queries/queries');
    var body = jsonEncode({
      'vendorid': vendorid,
      'querydetails': alld,
      'qtime': ordertime,
      'status': "Reported"
    });
    var response2 = await http.post(url2, headers: requestHeaders, body: body);
    if (response2.statusCode == 200) {
      print("Response Status : ${response2.statusCode}");
      print("Response body : " + response2.body.toString());
      createAlertDialog1(context);
    }
  }

  Future<List<Query>> displayquery() async {
    var url1 =
        Uri.parse('http://localhost:4000/vendor/vendor/vendor/$profile1');
    var response1 = await http.get(url1);
    var empjson = json.decode(response1.body.toString());
    var vendorid = empjson[0]["vendorid"];
    print("res :" + empjson);
    print("res1 :" + vendorid);
    var url2 =
        Uri.parse('http://localhost:4000/queries/queries/queryid/$vendorid');
    var response2 = await http.get(url2);
    var queryjson = json.decode(response2.body.toString());

    for (var u in queryjson) {
      Query query = Query(u["queryid"], u["vendorid"], u["querydetails"],
          u["qtime"], u["status"]);
      queryrecords.add(query);
    }
    print(queryrecords.length);
    setState(() {
      queryrecords;
    });
    return queryrecords;
  }

  createAlertDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            backgroundColor: Color.fromRGBO(21, 102, 59, 1),
            elevation: 20,
            title: Text(
              "Query Reported...!!",
              style: TextStyle(fontSize: 25, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String profile = widget.profile;
    profile1 = profile;

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Center(
                          child: Text(
                            "Report Queries",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      DataTable(
                        // ignore: prefer_const_literals_to_create_immutables
                        columns: [
                          DataColumn(label: Text("Query ID")),
                          DataColumn(label: Text("Query Details")),
                          DataColumn(label: Text("Status"))
                        ],
                        rows: queryrecords
                            .map<DataRow>((e) => DataRow(cells: [
                                  DataCell(Text(e.queryid.toString())),
                                  DataCell(Text(e.querydetails)),
                                  DataCell(Text(e.status))
                                ]))
                            .toList(),
                      )
                    ],
                  )),
              VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Center(
                          child: Text(
                            "Report Queries",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 10),
                        child: Text(
                          "Subject :",
                          style:
                              TextStyle(fontFamily: "WorkSans", fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: SizedBox(
                          height: 70,
                          width: 400,
                          child: TextField(
                            controller: _topic,
                            onChanged: (value) {
                              topic = value;
                              print(topic);
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white60,
                              filled: true,
                              hintText: "Enter query subject...",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 10),
                        child: Text(
                          "Details :",
                          style:
                              TextStyle(fontFamily: "WorkSans", fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: SizedBox(
                          height: 120,
                          width: 400,
                          child: TextField(
                            controller: _details,
                            maxLines: 5,
                            onChanged: (value) {
                              details = value;
                              print(details);
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white60,
                              filled: true,
                              hintText: "Enter query details...",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(101, 30, 62, 1),
                            ),
                            onPressed: () {
                              insertquery();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              child: Text(
                                "Place Query",
                                style: TextStyle(
                                    fontFamily: "WorkSans", fontSize: 25),
                              ),
                            )),
                      )
                    ],
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
