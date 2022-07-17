// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';

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
    late int totalprice;
    String quantity = "1";
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
                        onPressed: () {},
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
