// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, unused_local_variable, non_constant_identifier_names, avoid_print, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vendor_management_webapp/detailspage.dart';
import 'package:vendor_management_webapp/itemsclass.dart';
import 'package:http/http.dart' as http;

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
    String user = widget.profile;
    late List data;
    int lengthit = 7;
    bool fruits = false;
    bool vegetables = false;
    bool dairy = false;
    bool cereals = false;
    bool oils = false;
    bool Spices = false;
    bool newspaper = false;
    bool flower = false;
    bool detect = false;

    Future<List<Items>> recommend() async {
      List<Items> recommenditems = [];
      Items item =
          Items(1, "Apple", 120, "fruits", "kg", 1, "images/apples.jpg");
      recommenditems.add(item);
      item = Items(2, "Mangoes", 200, "fruits", "kg", 1, "images/mangoes.jpg");
      recommenditems.add(item);
      item =
          Items(5, "Tomatoes", 50, "vegetable", "kg", 2, "images/tomatoes.jpg");
      recommenditems.add(item);
      item = Items(7, "Onions", 50, "vegetable", "kg", 2, "images/onions.jpg");
      recommenditems.add(item);
      item = Items(
          8, "Beetroot", 70, "vegetable", "kg", 2, "images/beetroots.jpg");
      item = Items(17, "Chilli Powder", 50, "spices", "kg", 5,
          "images/everestchillipowder.jpeg");
      recommenditems.add(item);
      item = Items(18, "Kashmiri Lal Powder", 70, "spices", "kg", 5,
          "images/everestkashmiripowder.jpeg");
      recommenditems.add(item);
      item =
          Items(21, "Cinnamon", 50, "spices", "kg", 5, "images/cinnamon.jpg");
      recommenditems.add(item);

      print(recommenditems);
      return recommenditems;
    }

    Future<List<Items>> displayitems() async {
      var url = Uri.parse(
          'http://localhost:4000/items/items/iid/itemname/distinct/fruits');
      if (fruits == true) {
        url = Uri.parse(
            'http://localhost:4000/items/items/iid/itemname/distinct/fruits');
      }
      if (vegetables == true) {
        url = Uri.parse(
            'http://localhost:4000/items/items/iid/itemname/distinct/vegetable');
      }
      if (dairy == true) {
        url = Uri.parse(
            'http://localhost:4000/items/items/iid/itemname/distinct/dairy');
      }
      if (cereals == true) {
        url = Uri.parse(
            'http://localhost:4000/items/items/iid/itemname/distinct/cereals');
      }
      if (Spices == true) {
        url = Uri.parse(
            'http://localhost:4000/items/items/iid/itemname/distinct/spices');
      }
      if (oils == true) {
        url = Uri.parse(
            'http://localhost:4000/items/items/iid/itemname/distinct/oils');
      }
      if (flower == true) {
        url = Uri.parse(
            'http://localhost:4000/items/items/iid/itemname/distinct/flower');
      }
      if (newspaper == true) {
        url = Uri.parse(
            'http://localhost:4000/items/items/iid/itemname/distinct/newspaper');
      }
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var response = await http.get(url, headers: requestHeaders);
      var itemjson = json.decode(response.body);
      print(itemjson);
      List<Items> item = [];
      for (var u in itemjson) {
        Items menu = Items(u["itemid"], u["itemname"], u["price"],
            u["category"], u["mquantity"], u["vendorid"], u["itemimage"]);
        item.add(menu);
      }
      lengthit = item.length;
      print(item.toString());
      print(lengthit);
      return item;
    }

    @override
    void initState() {
      super.initState();
      displayitems();
    }

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
                          width: 120,
                        ),
                        Text(
                          "Hello " + user,
                          style: TextStyle(
                              fontFamily: "WorkSans",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                          onPressed: () {
                            setState(() {
                              fruits = !fruits;
                              detect = true;
                              vegetables = false;
                              Spices = false;
                              dairy = false;
                              cereals = false;
                              oils = false;
                              flower = false;
                              newspaper = false;
                            });
                            displayitems();
                          },
                          child: Text(
                            "Fruits",
                            style: TextStyle(
                                fontSize: 17,
                                color: (fruits == true)
                                    ? Colors.black
                                    : Colors.white),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: (vegetables == true)
                                ? Color.fromRGBO(21, 102, 59, 1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              vegetables = !vegetables;
                              fruits = false;
                              Spices = false;
                              dairy = false;
                              cereals = false;
                              oils = false;
                              flower = false;
                              newspaper = false;
                              detect = true;
                            });
                            displayitems();
                          },
                          child: Text(
                            "Vegetables",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: (dairy == true)
                                ? Color.fromRGBO(21, 102, 59, 1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              dairy = !dairy;
                              vegetables = false;
                              Spices = false;
                              fruits = false;
                              cereals = false;
                              oils = false;
                              flower = false;
                              detect = true;
                              newspaper = false;
                            });
                            displayitems();
                          },
                          child: Text(
                            "Dairy Products",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: (cereals == true)
                                ? Color.fromRGBO(21, 102, 59, 1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              cereals = !cereals;
                              vegetables = false;
                              Spices = false;
                              detect = true;
                              dairy = false;
                              fruits = false;
                              oils = false;
                              flower = false;
                              newspaper = false;
                            });
                            displayitems();
                          },
                          child: Text(
                            "Cereals",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: (Spices == true)
                                ? Color.fromRGBO(21, 102, 59, 1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              Spices = !Spices;
                              vegetables = false;
                              fruits = false;
                              dairy = false;
                              detect = true;
                              cereals = false;
                              oils = false;
                              flower = false;
                              newspaper = false;
                            });
                            displayitems();
                          },
                          child: Text(
                            "Spices",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: (oils == true)
                                ? Color.fromRGBO(21, 102, 59, 1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              oils = !oils;
                              vegetables = false;
                              Spices = false;
                              dairy = false;
                              cereals = false;
                              fruits = false;
                              detect = true;
                              flower = false;
                              newspaper = false;
                            });
                            displayitems();
                          },
                          child: Text(
                            "Oils",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: (flower == true)
                                ? Color.fromRGBO(21, 102, 59, 1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              flower = !flower;
                              vegetables = false;
                              Spices = false;
                              detect = true;
                              dairy = false;
                              cereals = false;
                              oils = false;
                              fruits = false;
                              newspaper = false;
                            });
                            displayitems();
                          },
                          child: Text(
                            "Flowers",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: (newspaper == true)
                                ? Color.fromRGBO(21, 102, 59, 1)
                                : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              newspaper = !newspaper;
                              vegetables = false;
                              Spices = false;
                              dairy = false;
                              cereals = false;
                              oils = false;
                              flower = false;
                              detect = true;
                              fruits = false;
                            });
                            displayitems();
                          },
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
            SizedBox(
              height: 250,
              child: FutureBuilder(
                initialData: recommend(),
                future: recommend(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return GridView.builder(
                      itemCount: lengthit,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      itemBuilder: (BuildContext context, int index) {
                        if (snapshot.data == null) {
                          return Container(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 10, primary: Colors.white),
                                onPressed: () {
                                  int iid = snapshot.data[index].itemid;
                                  String iname = snapshot.data[index].itemname;
                                  String iprice =
                                      snapshot.data[index].price.toString();
                                  String icategory =
                                      snapshot.data[index].category;
                                  String imqu = snapshot.data[index].mquantity;
                                  int ivendorid = snapshot.data[index].vendorid;
                                  String iimage =
                                      snapshot.data[index].itemimage;

                                  print(iname);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detailspage(
                                              profile: user,
                                              itemname: iname,
                                              itemid: iid,
                                              price: iprice,
                                              category: icategory,
                                              mquantity: imqu,
                                              vendorid: ivendorid,
                                              itemimage: iimage)));
                                },
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        snapshot.data[index].itemimage,
                                        fit: BoxFit.cover,
                                        //scale: 0.9,
                                        //height: 50,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Text(
                                        snapshot.data[index].itemname,
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      ),
                                    )
                                  ],
                                )),
                          );
                        }
                      });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 250,
              child: FutureBuilder(
                future: displayitems(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return GridView.builder(
                      //itemCount: lengthit,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      itemBuilder: (BuildContext context, int index) {
                        if (detect == false) {
                          if (snapshot.data == null) {
                            return Container(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Text("");
                          }
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 10, primary: Colors.white),
                                onPressed: () {
                                  int iid = snapshot.data[index].itemid;
                                  String iname = snapshot.data[index].itemname;
                                  String iprice =
                                      snapshot.data[index].price.toString();
                                  String icategory =
                                      snapshot.data[index].category;
                                  String imqu = snapshot.data[index].mquantity;
                                  int ivendorid = snapshot.data[index].vendorid;
                                  String iimage =
                                      snapshot.data[index].itemimage;

                                  print(iname);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detailspage(
                                              profile: user,
                                              itemname: iname,
                                              itemid: iid,
                                              price: iprice,
                                              category: icategory,
                                              mquantity: imqu,
                                              vendorid: ivendorid,
                                              itemimage: iimage)));
                                },
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        snapshot.data[index].itemimage,
                                        fit: BoxFit.cover,
                                        //scale: 0.9,
                                        //height: 50,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Text(
                                        snapshot.data[index].itemname,
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      ),
                                    )
                                  ],
                                )),
                          );
                        }
                      });
                },
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      )),
    );
  }
}
