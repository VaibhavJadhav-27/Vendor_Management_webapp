// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_field, prefer_final_fields, avoid_print, non_constant_identifier_names, unused_element

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _fname = TextEditingController();
  late TextEditingController _lname = TextEditingController();
  late TextEditingController _contactno = TextEditingController();
  late TextEditingController _emailid = TextEditingController();
  late TextEditingController _residence = TextEditingController();
  late TextEditingController _password = TextEditingController();

  String fname = "";
  String lname = "";
  String contactno = "";
  String emailid = "";
  String residence = "";
  String password = "";
  String notify = "";

  @override
  Widget build(BuildContext context) {
    createAlertDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(10),
              backgroundColor: Color.fromRGBO(101, 30, 62, 1),
              elevation: 20,
              title: Text(
                notify,
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

    void create_customer() async {
      var url = Uri.parse('http://localhost:4000/customer/customer');
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var body = jsonEncode({
        'custfname': fname,
        'custlname': lname,
        'contactno': contactno,
        'emailid': emailid,
        'residence': residence
      });
      var response = await http.post(url, headers: requestHeaders, body: body);
      if (response.statusCode == 200) {
        print("Response Status : ${response.statusCode}");
        print("Response body : " + response.body.toString());
        if (response.body.toString() == "Duplicate entries..!!!") {
          print("Email or phone no is already registered..!!!");
          notify = "Email or phone no is already registered..!!!";
          createAlertDialog(context);
        } else {
          var url1 = Uri.parse('http://localhost:4000/login/login');
          Map<String, String> requestHeaders = {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          };
          var body1 = jsonEncode({
            'emailid': emailid,
            'password': password,
            'logintype': 'customer'
          });
          var response1 =
              await http.post(url1, headers: requestHeaders, body: body1);
          if (response1.statusCode == 200) {
            print("Response status = ${response1.statusCode}");
            print("Response body : " + response1.body.toString());
            Navigator.pop(context);
          }
        }
      }
    }

    void create_vendor() async {
      var url = Uri.parse('http://localhost:4000/vendor/vendor');
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var body = jsonEncode({
        'vendorfname': fname,
        'vendorlname': lname,
        'contactno': contactno,
        'emailid': emailid,
        'residence': residence
      });
      var response = await http.post(url, headers: requestHeaders, body: body);
      if (response.statusCode == 200) {
        print("Response Status : ${response.statusCode}");
        print("Response body : " + response.body.toString());
        if (response.body.toString() == "Duplicate entries..!!!") {
          print("Email or phone no is already registered..!!!");
          notify = "Email or phone no is already registered..!!!";
          createAlertDialog(context);
        } else {
          var url1 = Uri.parse('http://localhost:4000/login/login');
          Map<String, String> requestHeaders = {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          };
          var body1 = jsonEncode({
            'emailid': emailid,
            'password': password,
            'logintype': 'vendor'
          });
          var response1 =
              await http.post(url1, headers: requestHeaders, body: body1);
          if (response1.statusCode == 200) {
            print("Response status = ${response1.statusCode}");
            print("Response body : " + response1.body.toString());
            Navigator.pop(context);
          }
        }
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.greenAccent,
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
                child: Container(
                  color: Colors.amberAccent,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          " Register Account ",
                          style: TextStyle(
                              fontFamily: "WorkSans",
                              fontSize: 40,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 540,
                              height: 380,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      child: Text(
                                        "First Name :",
                                        style: TextStyle(
                                            fontFamily: "WorkSans",
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SizedBox(
                                        height: 70,
                                        width: 400,
                                        child: TextField(
                                          controller: _fname,
                                          onChanged: (value) {
                                            fname = value;
                                            print(fname);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                "Enter your first name...",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      child: Text(
                                        "Contact no :",
                                        style: TextStyle(
                                            fontFamily: "WorkSans",
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SizedBox(
                                        height: 70,
                                        width: 400,
                                        child: TextField(
                                          controller: _contactno,
                                          onChanged: (value) {
                                            contactno = value;
                                            print(contactno);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                "Enter your contact no....",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      child: Text(
                                        "Residence :",
                                        style: TextStyle(
                                            fontFamily: "WorkSans",
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SizedBox(
                                        height: 70,
                                        width: 400,
                                        child: TextField(
                                          controller: _residence,
                                          onChanged: (value) {
                                            residence = value;
                                            print(residence);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                "Enter your residence....",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 540,
                              height: 380,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      child: Text(
                                        "Last Name :",
                                        style: TextStyle(
                                            fontFamily: "WorkSans",
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SizedBox(
                                        height: 70,
                                        width: 400,
                                        child: TextField(
                                          controller: _lname,
                                          onChanged: (value) {
                                            lname = value;
                                            print(lname);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                "Enter your last name....",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      child: Text(
                                        "Email ID :",
                                        style: TextStyle(
                                            fontFamily: "WorkSans",
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SizedBox(
                                        height: 70,
                                        width: 400,
                                        child: TextField(
                                          controller: _emailid,
                                          onChanged: (value) {
                                            emailid = value;
                                            print(emailid);
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Enter your email id....",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 10),
                                      child: Text(
                                        "Password :",
                                        style: TextStyle(
                                            fontFamily: "WorkSans",
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SizedBox(
                                        height: 70,
                                        width: 400,
                                        child: TextField(
                                          controller: _password,
                                          onChanged: (value) {
                                            password = value;
                                            print(password);
                                          },
                                          obscureText: true,
                                          obscuringCharacter: '*',
                                          decoration: InputDecoration(
                                            hintText: "Enter your password....",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (fname == "" ||
                                    lname == "" ||
                                    contactno == "" ||
                                    emailid == "" ||
                                    residence == "" ||
                                    password == "") {
                                  print("Fill all the fields...!!");
                                  setState(() {
                                    notify = "Fill all the fields";
                                  });
                                  createAlertDialog(context);
                                } else {
                                  create_customer();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 37, vertical: 15),
                                child: Text(
                                  "Register as Customer",
                                  style: TextStyle(
                                      fontFamily: "WorkSans", fontSize: 20),
                                ),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                if (fname == "" ||
                                    lname == "" ||
                                    contactno == "" ||
                                    emailid == "" ||
                                    residence == "" ||
                                    password == "") {
                                  print("Fill all the fields...!!");
                                  setState(() {
                                    notify = "Fill all the fields";
                                  });
                                  createAlertDialog(context);
                                } else {
                                  create_vendor();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                                child: Text(
                                  "Register as Vendor",
                                  style: TextStyle(
                                      fontFamily: "WorkSans", fontSize: 20),
                                ),
                              ))
                        ],
                      )
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
