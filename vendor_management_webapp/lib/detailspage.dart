// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_final_fields, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Detailspage extends StatefulWidget {
  final String profile;
  final String itemname;
  final int itemid;
  final String price;
  final String category;
  final String mquantity;
  final int vendorid;
  final String itemimage;
  Detailspage(
      {Key? key,
      required this.profile,
      required this.itemname,
      required this.itemid,
      required this.price,
      required this.category,
      required this.mquantity,
      required this.vendorid,
      required this.itemimage})
      : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  TextEditingController _qt = TextEditingController();
  late int totalprice;
  String quantity = "1";

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            backgroundColor: Color.fromRGBO(21, 102, 59, 1),
            elevation: 20,
            title: Text(
              "Added to cart",
              style: TextStyle(
                  fontFamily: "Comfortaa", fontSize: 25, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            content: Image.asset("assets/images/Vector.png"),
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
    String profile = widget.profile;
    String itemname = widget.itemname;
    int itemid = widget.itemid;
    String price = widget.price;
    String category = widget.category;
    String mquantity = widget.mquantity;
    int vendorid = widget.vendorid;
    String itemimmage = widget.itemimage;

    void updatequantity() {
      setState(() {
        if (int.parse(quantity) < 1) {
          quantity = "1";
        } else {
          quantity;
        }
        print("value of quantity in updatequantity inset state : " + quantity);
        totalprice = int.parse(price) * int.parse(quantity);
        print(totalprice.toString());
      });
      print("value of quantity outside set state : " + quantity);
      print("total out of set state :" + totalprice.toString());
    }

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      this.dispose();
    }

    void updatecartitems() async {
      var url1 =
          Uri.parse('http://localhost:4000/customer/customer/cust/$profile');
      Map<String, String> requestHeaders1 = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var response = await http.get(url1, headers: requestHeaders1);
      var custjson = json.decode(response.body);
      print(custjson);
      int custid = custjson[0]["custid"];
      print(custid);

      // checking if the item is present in the cart of that particular customer
      var url2 = Uri.parse('http://localhost:4000/cart/cart/$custid/$itemid');
      Map<String, String> requestHeaders2 = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var response2 = await http.get(url2, headers: requestHeaders2);
      var itemjson = json.decode(response2.body);
      print(itemjson);
      try {
        //if data is present, update the quantity
        int iid = itemjson[0]["itemid"];
        int iprice = itemjson[0]["price"];
        int res = iprice * int.parse(quantity);
        print("data available");
        var url = Uri.parse('http://192.168.0.103:4000/cart/cart');
        Map<String, String> requestHeaders = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
        print(totalprice);
        print(quantity);
        var body = jsonEncode({
          'custid': custid,
          'itemid': itemid,
          'price': int.parse(price),
          'mquantity': int.parse(quantity),
          'totalprice': res,
        });
        var response1 =
            await http.put(url, headers: requestHeaders, body: body);
        if (response1.statusCode == 200) {
          print("Response Status : ${response1.statusCode}");
          print("Response body : " + response1.body.toString());
        }
      } on RangeError {
        //if data is not present, insert all the details
        var url4 = Uri.parse('http://localhost:4000/items/items/$itemname');
        Map<String, String> requestHeaders2 = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
        var response2 = await http.get(url4, headers: requestHeaders2);
        var item1json = json.decode(response2.body);
        print(item1json);
        int iprice = item1json[0]["price"];
        int res = iprice * int.parse(quantity);
        print("Not available");
        var url = Uri.parse('http://localhost:4000/cart/cart');
        Map<String, String> requestHeaders = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        };
        var body = jsonEncode({
          'custid': custid,
          'itemid': itemid,
          'vendorid': vendorid,
          'itemname': itemname,
          'itemimage': itemimmage,
          'price': int.parse(price),
          'mquantity': int.parse(quantity),
          'totalprice': res
        });
        var response1 =
            await http.post(url, headers: requestHeaders, body: body);
        if (response1.statusCode == 200) {
          print("Response Status : ${response1.statusCode}");
          print("Response body : " + response1.body.toString());
        }
      } catch (e) {
        print("Not available");
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amberAccent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Container(
                color: Colors.greenAccent,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 300,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.outline),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Expanded(child: Image.asset(itemimmage)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, bottom: 20),
                      child: Row(
                        children: [
                          Text("Item Name : ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          SizedBox(
                            width: 20,
                          ),
                          Text(itemname,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, bottom: 20),
                      child: Row(
                        children: [
                          Text("Price : ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Rs. " + price,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Quantity : ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(
                              controller: _qt,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  quantity = value;
                                  print("Value of quantity when pressed : " +
                                      quantity);
                                  updatequantity();
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          updatecartitems();
                          createAlertDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(101, 30, 62, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 20, left: 20),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Container(color: Colors.lightBlue),
            )
          ],
        ),
      )),
    ));
  }
}
