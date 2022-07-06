class Cart {
  late int custid;
  late int itemid;
  late int vendorid;
  late String itemname;
  late String itemimage;
  late int price;
  late int mquantity;
  late int totalprice;

  Cart(this.custid, this.itemid, this.itemname, this.vendorid, this.itemimage,
      this.price, this.mquantity, this.totalprice);
}
