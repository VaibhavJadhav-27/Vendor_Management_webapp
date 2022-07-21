// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vendor_management_webapp/accountpage.dart';
import 'package:vendor_management_webapp/orderspage.dart';
import 'package:vendor_management_webapp/queriespage.dart';

class VendorPage extends StatefulWidget {
  final String profile;
  VendorPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  @override
  Widget build(BuildContext context) {
    String profile = widget.profile;
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
                                  builder: ((context) => AccountPage(
                                        profile: profile,
                                        type: "vendor",
                                      ))));
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
                                  builder: ((context) =>
                                      OrdersPage(profile: profile))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 56, vertical: 15),
                          child: Text(
                            "Orders",
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
                                  builder: ((context) => Queriespage(
                                        profile: profile,
                                      ))));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: Text(
                            "Queries",
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
