// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_import, unused_local_variable, non_constant_identifier_names, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vendor_management_webapp/adminpage.dart';
import 'package:vendor_management_webapp/homepage.dart';
import 'package:vendor_management_webapp/registerpage.dart';
import 'package:vendor_management_webapp/vendorpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _email = TextEditingController();
  late TextEditingController _pass = TextEditingController();

  String emailid = "";
  String password = "";
  String type = "";
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
                "Wrong inputs..!!",
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

    void verify_password() async {
      var url1 =
          Uri.parse('http://localhost:4000/login/login/$emailid/$password');
      var response1 = await http.get(url1);
      var responsejson = json.decode(response1.body.toString());
      print(response1.body);
      if (responsejson == "NO entries") {
        setState(() {
          notify = "Wrong Inputs..!!!";
          createAlertDialog(context);
        });
      } else {
        var status = responsejson[0]["logintype"];
        print(status);
        if (status == "admin") {
          var url2 = Uri.parse('http://localhost:4000/admin/admin/$emailid');
          var response2 = await http.get(url2);
          var empjson = json.decode(response2.body.toString());
          var profile = empjson[0]["adminfname"];
          print(profile);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AdminPage(profile: profile)));
        }
        if (status == "staff") {
          var url2 = Uri.parse('http://localhost:4000/staff/staff/$emailid');
          var response2 = await http.get(url2);
          var empjson = json.decode(response2.body.toString());
          var profile = empjson[0]["stafffname"];
          print(profile);
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        if (status == "vendor") {
          var url2 = Uri.parse('http://localhost:4000/vendor/vendor/$emailid');
          var response2 = await http.get(url2);
          var empjson = json.decode(response2.body.toString());
          var profile = empjson[0]["vendorfname"];
          print(profile);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VendorPage(profile: profile)));
        }
        if (status == "customer") {
          var url2 =
              Uri.parse('http://localhost:4000/customer/customer/$emailid');
          var response2 = await http.get(url2);
          var empjson = json.decode(response2.body.toString());
          var profile = empjson[0]["custfname"];
          print(profile);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        profile: profile,
                      )));
        }
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg1.jpg'), fit: BoxFit.cover),
          ),
          //color: Colors.blueAccent,
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
                        width: 635,
                        child: Container(
                          color: Color.fromARGB(255, 246, 217, 111),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 35,
                                ),
                                Center(
                                  child: Text(
                                    "Welcome back. Please login to your account",
                                    style: TextStyle(
                                        fontFamily: "WorkSans", fontSize: 20),
                                  ),
                                ),
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
                                    onChanged: (value) {
                                      emailid = value;
                                      print(emailid);
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter email id....",
                                      fillColor: Colors.white60,
                                      filled: true,
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
                                    onChanged: (value) {
                                      password = value;
                                      print(password);
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white60,
                                      filled: true,
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
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(101, 30, 62, 1),
                                        ),
                                        onPressed: () {
                                          if (emailid == "" || password == "") {
                                            print("Fill all the fields...!!");
                                            setState(() {
                                              notify = "Fill all the fields";
                                            });
                                          } else {
                                            verify_password();
                                          }
                                        },
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
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(101, 30, 62, 1),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      RegisterPage())));
                                        },
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
                      SizedBox(
                        child: Container(
                          child: Image.asset(
                            'images/shopping.jpg',
                            //scale: 0.3,
                          ),
                        ),
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
