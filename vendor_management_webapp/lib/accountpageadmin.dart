// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, prefer_const_literals_to_create_immutables, unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountPage1 extends StatefulWidget {
  final String profile;
  final String type;
  AccountPage1({Key? key, required this.profile, required this.type})
      : super(key: key);

  @override
  State<AccountPage1> createState() => _AccountPageState1();
}

class _AccountPageState1 extends State<AccountPage1> {
  String profile = "";
  String lname = " ";
  String contactno = " ";
  String email = " ";
  String residence = " ";
  String custid = " ";
  String type = "";

  void getUserDetails() async {
    //profile = "Akash";
    var url =
        Uri.parse('http://localhost:4000/admin/admin/admin1/admin1/$profile');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(url);
    var resultjson = json.decode(response.body);
    print(resultjson);
    print(resultjson[0]["custid"].toString());
    setState(() {
      custid = resultjson[0]["adminid"].toString();
      email = resultjson[0]["emailid"];
      contactno = resultjson[0]["conatactno"];
      lname = resultjson[0]["adminlname"];
    });
    print(custid);
    print(email);
    print(contactno);
    print(lname);
    print(residence);
  }

  @override
  void initState() {
    super.initState();
    print("initstate");
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    String profile1 = widget.profile;
    String type1 = widget.type;
    profile = profile1;
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
                width: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 154, 145, 145),
                      child: Image.asset(
                        "images/profile.png",
                        color: Colors.black,
                        scale: 1.2,
                      ),
                      radius: 80,
                    )),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Full Name : ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            profile + " " + "Jadhav",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Contact No : ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            contactno,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Email ID : ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            email,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Residence : ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Jogeshwari East",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
