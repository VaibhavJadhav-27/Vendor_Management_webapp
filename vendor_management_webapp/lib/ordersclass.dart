class Orders {
  late int orderid;
  late int custid;
  late int vendorid;
  late String details;
  late int totalprice;
  late String ordertype;
  late DateTime otime;
  late String isReceived;

  Orders(this.orderid, this.custid, this.vendorid, this.details,
      this.totalprice, this.ordertype, this.otime, this.isReceived);
}
