// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:vendor_management_webapp/accountpage.dart';
import 'package:vendor_management_webapp/accountpageadmin.dart';
import 'package:vendor_management_webapp/vieworders.dart';
import 'package:vendor_management_webapp/viewquery.dart';
import 'package:vendor_management_webapp/viewstaff.dart';

class AdminPage extends StatefulWidget {
  final String profile;
  AdminPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    String profile = widget.profile;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.amberAccent,
          child: Center(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: SizedBox(
                height: 700,
                width: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: Text(
                      "Welcome " + profile,
                      style: TextStyle(fontFamily: "WorkSans", fontSize: 30),
                    )),
                    SizedBox(
                      height: 50,
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountPage1(
                                      profile: profile, type: "admin")));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Text(
                            "Account Info",
                            style:
                                TextStyle(fontFamily: "WorkSans", fontSize: 20),
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewOrder()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 56, vertical: 15),
                          child: Text(
                            " View Orders",
                            style:
                                TextStyle(fontFamily: "WorkSans", fontSize: 20),
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewQuery()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: Text(
                            "View Queries",
                            style:
                                TextStyle(fontFamily: "WorkSans", fontSize: 20),
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewStaff()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: Text(
                            "Staff Details",
                            style:
                                TextStyle(fontFamily: "WorkSans", fontSize: 20),
                          ),
                        ))
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
