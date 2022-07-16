// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String profile;
  const HomePage({Key? key, required this.profile}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchtext = TextEditingController();
  String searcht = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("LOGO",
                            style: TextStyle(
                                fontFamily: "WorkSans",
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        /*SizedBox(
                          width: 150,
                        )*/
                        Spacer(),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: TextField(
                                  controller: _searchtext,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(101, 30, 62, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 20,
                                        left: 20),
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Account",
                              style: TextStyle(
                                  fontFamily: "WorkSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Cart",
                              style: TextStyle(
                                  fontFamily: "WorkSans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Fruits",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Vegetables",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Dairy Products",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Cereals",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Spices",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Oils",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Flowers",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Newspapers",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Container(color: Colors.greenAccent),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("Keep Shopping for...",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: "WorkSans")),
            ),
          ],
        ),
      )),
    );
  }
}
