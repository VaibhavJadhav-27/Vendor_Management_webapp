// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unused_element, avoid_unnecessary_containers, unused_local_variable

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
          color: Colors.greenAccent,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "Added Items",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 500,
                child: FutureBuilder(
                    future: display,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                          itemCount: lengthct,
                          itemBuilder: (BuildContext context, int index) {
                            if (snapshot.data == null) {
                              return Container(
                                child: Text(
                                  "No items in Cart..!!",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Expanded(
                                          child: Image.asset(
                                              snapshot.data[index].itemimage),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Text(
                                              snapshot.data[index].itemname,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Text(
                                            snapshot.data[index].mquantity
                                                    .toString() +
                                                "x",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Rs. " +
                                                snapshot.data[index].price
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
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
                                                size: 25,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                            }
                          });
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
