// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Search"))
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
            )
          ],
        ),
      )),
    );
  }
}
