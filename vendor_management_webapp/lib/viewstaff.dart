// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vendor_management_webapp/staffclass.dart';

class ViewStaff extends StatefulWidget {
  const ViewStaff({Key? key}) : super(key: key);

  @override
  State<ViewStaff> createState() => _ViewStaffState();
}

class _ViewStaffState extends State<ViewStaff> {
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  List<Staff> staffjson = [];
  String staffid = "";
  String fname = "";
  String lname = "";
  String contact = "";
  String email = "";
  String pass = "";

  Future<List<Staff>> viewstaff() async {
    var url = Uri.parse('http://localhost:4000/staff/staff');
    var response = await http.get(url);
    var staffrecords = json.decode(response.body);
    for (var u in staffrecords) {
      Staff or = Staff(u["staffid"], u["stafffname"], u["stafflname"],
          u["contactno"], u["emailid"]);

      staffjson.add(or);
    }
    int lengthct = staffjson.length;
    print(lengthct);
    setState(() {
      staffjson;
    });
    return staffjson;
  }

  void insertstaff() async {
    var url = Uri.parse('http://localhost:4000/staff/staff');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = jsonEncode({
      'stafffname': fname,
      'stafflname': lname,
      'contactno': contact,
      'emailid': email
    });
    var response = await http.post(url, headers: requestHeaders, body: body);
    if (response.statusCode == 200) {
      print("Response Status : ${response.statusCode}");
      print("Response body : " + response.body.toString());

      var url1 = Uri.parse('http://localhost:4000/login/login');
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var body1 = jsonEncode(
          {'emailid': email, 'password': pass, 'logintype': "staff"});
      var response1 =
          await http.post(url1, headers: requestHeaders, body: body1);
      if (response1.statusCode == 200) {
        print("Response Status : ${response.statusCode}");
        print("Response body : " + response.body.toString());
        createAlertDialog1(context);
        staffjson = [];
        viewstaff();
      }
    }
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
              "Staff Record Added...!!",
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
  void initState() {
    super.initState();
    viewstaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 246, 217, 111),
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
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Center(
                        child: Text(
                          "Staff Details",
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
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    DataTable(
                        columns: [
                          DataColumn(
                              label: Text(
                            "Staff ID",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Staff First Name",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Staff Last Name",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Contact Number",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            "Email ID",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))
                        ],
                        rows: staffjson
                            .map<DataRow>((e) => DataRow(cells: [
                                  DataCell(
                                    Text(e.staffid.toString()),
                                    onTap: () {
                                      setState(() {
                                        staffid = e.staffid.toString();
                                        print(staffid);
                                      });
                                    },
                                  ),
                                  DataCell(Text(e.stafffname.toString())),
                                  DataCell(Text(e.stafflname.toString())),
                                  DataCell(Text(e.contactno.toString())),
                                  DataCell(Text(e.emailid.toString())),
                                ]))
                            .toList()),
                  ],
                ),
              ),
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
                        height: 30,
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
                        height: 40,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 8),
                            child: Text(
                              "Staff ID : ",
                              style: TextStyle(
                                  fontFamily: "WorkSans", fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              staffid,
                              style: TextStyle(
                                  fontFamily: "WorkSans", fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 8),
                        child: Text(
                          "Staff First Name :",
                          style:
                              TextStyle(fontFamily: "WorkSans", fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: TextField(
                            controller: _fname,
                            onChanged: (value) {
                              fname = value;
                              print(fname);
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white60,
                              filled: true,
                              hintText: "Enter staff first name...",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 8),
                        child: Text(
                          "Staff Last Name :",
                          style:
                              TextStyle(fontFamily: "WorkSans", fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: TextField(
                            controller: _lname,
                            onChanged: (value) {
                              lname = value;
                              print(lname);
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white60,
                              filled: true,
                              hintText: "Enter staff last name...",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 8),
                        child: Text(
                          "Contact Number :",
                          style:
                              TextStyle(fontFamily: "WorkSans", fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: TextField(
                            controller: _contact,
                            onChanged: (value) {
                              contact = value;
                              print(contact);
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white60,
                              filled: true,
                              hintText: "Enter contact number...",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 8),
                        child: Text(
                          "Email ID :",
                          style:
                              TextStyle(fontFamily: "WorkSans", fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: TextField(
                            controller: _email,
                            onChanged: (value) {
                              email = value;
                              print(email);
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white60,
                              filled: true,
                              hintText: "Enter Email ID...",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 8),
                        child: Text(
                          "Password :",
                          style:
                              TextStyle(fontFamily: "WorkSans", fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: TextField(
                            controller: _pass,
                            obscureText: true,
                            obscuringCharacter: '*',
                            onChanged: (value) {
                              pass = value;
                              print(pass);
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white60,
                              filled: true,
                              hintText: "Enter Password...",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 10),
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(101, 30, 62, 1),
                              ),
                              onPressed: () {
                                insertstaff();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "Add Staff",
                                  style: TextStyle(
                                      fontFamily: "WorkSans", fontSize: 17),
                                ),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(101, 30, 62, 1),
                              ),
                              onPressed: () {
                                //insertquery();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "Remove Staff",
                                  style: TextStyle(
                                      fontFamily: "WorkSans", fontSize: 17),
                                ),
                              )),
                        ],
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
