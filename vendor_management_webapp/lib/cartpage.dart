// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unused_element, avoid_unnecessary_containers, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:vendor_management_webapp/cartclass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class cartPage extends StatefulWidget {
  final String profile;
  cartPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  int lengthct = 0;
  int total = 0;
  late int previous_total;
  bool check = false;
  late int cid;
  late int iid;
  String profile = "";
  var display;

  @override
  void initState() {
    super.initState();
    display = displaycart();
    print("initstate");
  }

  Future<List<Cart>> displaycart() async {
    var url1 = Uri.parse('http://localhost:4000/customer/customer/$profile');
    Map<String, String> requestHeaders1 = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response1 = await http.get(url1, headers: requestHeaders1);
    var custjson = json.decode(response1.body);
    print(custjson);
    int custid = custjson[0]["custid"];
    print("cust id : " + custid.toString());
    //getting cart item from cart using custid
    var url2 = Uri.parse('http://localhost:4000/cart/cart/$custid');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(url2, headers: requestHeaders);
    var cartjson = json.decode(response.body);
    print(cartjson);

    List<Cart> cartitems = [];
    for (var u in cartjson) {
      Cart cart = Cart(u["custid"], u["itemid"], u["itemname"], u["vendorid"],
          u["itemimage"], u["price"], u["mquantity"], u["totalprice"]);
      total = total + cart.totalprice;
      cartitems.add(cart);
    }
    lengthct = cartitems.length;
    print(lengthct);
    //print(cartitems);
    print("Total price : " + total.toString());
    return cartitems;
  }

  void placeorder() async {
    var url1 =
        Uri.parse('http://localhost:4000/customer/customer/cust/$profile');
    Map<String, String> requestHeaders1 = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response1 = await http.get(url1, headers: requestHeaders1);
    var custjson = json.decode(response1.body);
    print(custjson);
    int custid = custjson[0]["custid"];
    print("cust id : " + custid.toString());

    var url2 = Uri.parse('http://localhost:4000/cart/cart/$custid');
    var response2 = await http.get(url2);
    var cartjson = json.decode(response2.body);
    print("cart json : ");
    print(cartjson);

    List vendorid = [];
    for (var u in cartjson) {
      int a = u["vendorid"];
      print("v id : " + a.toString());
      vendorid.add(a);
    }
    int vid = vendorid[0];
    //print("vendorid list : " + vendorid.toString());
    var items = "";
    var listitems = "";
    for (var u in cartjson) {
      items = " Item Name : " +
          u["itemname"] +
          "  Quantity: " +
          u["mquantity"].toString();
      listitems = listitems + items;
    }
    print(listitems);
    var url3 = Uri.parse('http://localhost:4000/orderdb/orderdb');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var now1 = DateTime.now();
    var ordertime =
        "${now1.year}-${now1.month}-${now1.day} ${now1.hour}:${now1.minute}:${now1.second}";
    var ordertime1 = ordertime;
    print(ordertime);
    print(ordertime1);
    var body = jsonEncode({
      'custid': custid,
      'vendorid': vid,
      'details': listitems,
      'totalprice': total,
      'ordertype': 'pickup',
      'otime': ordertime,
      'isReceived': 'no'
    });
    var response3 = await http.post(url3, headers: requestHeaders, body: body);

    if (response3.statusCode == 200) {
      print("Response status = ${response3.statusCode}");
      print("Response body : " + response3.body.toString());
      createAlertDialog1(context);
    }
    /*
    for (var i in vendorid) {
      var items = "";
      var listitems = "";
      int total1 = 0;
      for (var u in cartjson) {
        if (i == u["vendorid"]) {
          items = " Item Name : " +
              u["itemname"] +
              "  Quantity: " +
              u["mquantity"].toString();
          listitems = listitems + items;
          int pri = u["price"];
          int qua = u["quantity"];
          total1 = total1 + (pri * qua);
        }
      }
      print(listitems);
      var url3 = Uri.parse('http://192.168.0.103:4000/ordersdb/ordersdb');
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var now1 = DateTime.now();
      var ordertime =
          "${now1.year}-${now1.month}-${now1.day} ${now1.hour}:${now1.minute}:${now1.second}";
      var ordertime1 = ordertime;
      print(ordertime);
      print(ordertime1);
      var body = jsonEncode({
        'custid': custid,
        'vendorid': i,
        'details': listitems,
        'totalprice': total1,
        'ordertype': 'pickup',
        'otime': ordertime,
        'isReceived': 'no'
      });
      var response3 =
          await http.post(url3, headers: requestHeaders, body: body);

      if (response3.statusCode == 200) {
        print("Response status = ${response3.statusCode}");
        print("Response body : " + response3.body.toString());
      }
    }*/
    //createAlertDialog1(context);
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
              "Order Placed...!!",
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
    String profile1 = "Akash";
    profile = profile1;

    createAlertDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(10),
              backgroundColor: Color.fromRGBO(21, 102, 59, 1),
              elevation: 20,
              title: Text(
                "Delete item from Cart ?",
                style: TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      check = true;
                      previous_total = total;
                      var url = Uri.parse(
                          'http://192.168.0.103:4000/cart/cart/delete/$cid/$iid');
                      var response = await http.delete(url);
                      var result = json.decode(response.body);
                      print("Response Status code : ${response.statusCode}");
                      print("Response body : " + response.body.toString());
                      setState(() {
                        displaycart();
                        if (previous_total < total) {
                          total = previous_total;
                        }
                        print(total);
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ))
              ],
            );
          });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 246, 217, 111),
          child: Center(
            child: SizedBox(
              height: 700,
              width: 500,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Added Items",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "WorkSans"),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: FutureBuilder(
                        future: display,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return ListView.builder(
                              itemCount: lengthct,
                              itemBuilder: (BuildContext context, int index) {
                                if (snapshot.data == null) {
                                  return Container(
                                    child: Text(
                                      "No items in Cart..!!",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "WorkSans"),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                } else {
                                  return Container(
                                      child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset(
                                                snapshot.data[index].itemimage),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 5),
                                            child: Text(
                                              "Item Name : " +
                                                  snapshot.data[index].itemname,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data[index].mquantity
                                                        .toString() +
                                                    "x",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                "Rs. " +
                                                    snapshot.data[index].price
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                cid =
                                                    snapshot.data[index].custid;
                                                iid =
                                                    snapshot.data[index].itemid;
                                                createAlertDialog(context);
                                              },
                                              icon: Icon(
                                                Icons.delete_rounded,
                                                size: 35,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ));
                                }
                              });
                        }),
                  ),
                  Divider(thickness: 2, color: Colors.black),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("total :" + total.toString());
                        placeorder();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(101, 30, 62, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 30, left: 30),
                        child: Text(
                          "Place Order",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
