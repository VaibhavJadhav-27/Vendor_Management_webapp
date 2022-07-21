var Router = require('express')
const router7=Router();

const mysqlConnection = require('../database/database');
router7.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

router7.get('/:orderdb', async(req, res) => {
    mysqlConnection.query('select orderid,custid,vendorid,details,totalprice,ordertype,isReceived from ordersdb;', (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router7.get('/:orderdb/:orderid', async(req, res) => {
    var orderid = req.params.orderid;
    console.log(deliveryid);
    mysqlConnection.query('select * from ordersdb where orderid=? ;', [orderid], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
            console.log(rows);

        } else {
            console.log(error);
        }
    });
});

router7.get('/:orderdb/orderid/:custid', async(req, res) => {
    var custid = req.params.custid;
    console.log(custid);
    mysqlConnection.query('select * from ordersdb where custid=? ;', [custid], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
            console.log(rows);

        } else {
            console.log(error);
        }
    });
});

router7.get('/orderdb/orderid/:custid/:otime',async(req,res) => {
    var custid = req.params.custid;
    var datetime = req.params.datetime;
    mysqlConnection.query('select * from ordersdb where custid =? and otime = ?',[custid,datetime],(error,rows,fields) => {
        if(!error){
            res.json(rows);
            console.log(rows);
        }
        else{
            res.send(error);
            console.log(rows);
        }
    });
});

router7.post('/:orderdb', (req, res) => {
    var orderid = req.body.orderid;
    var custid = req.body.custid;
    var vendorid = req.body.vendorid;
    var details = req.body.details;
    var totalprice = req.body.totalprice;
    var ordertype = req.body.ordertype;
    var otime = req.body.otime;
    var isreceived = req.body.isReceived;
    //console.log(orderid);
    console.log(custid);
    console.log(vendorid);
    console.log(details);
    console.log(totalprice);
    console.log(ordertype);
    console.log(otime);
    console.log(isreceived);
    mysqlConnection.query('insert into ordersdb values(?,?,?,?,?,?,?,?);', [orderid,custid, vendorid, details, totalprice, ordertype, otime, isreceived], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Customer registered ..!!' });
            res.send('Order record inserted successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send(error);
        }
    });

});

router7.put('/orderdb/:orderid/:isReceived', (req, res) => {
    var orderid = req.body.orderid;
    var status = req.body.isReceived;
    console.log(status);
    mysqlConnection.query('update ordersdb set isReceived=? where orderid = ?', [status, orderid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Order data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});

router7.delete('/orderdb', (req, res) => {
    var orderid = req.body.orderid;
    console.log(orderid);
    mysqlConnection.query('delete from ordersdb where orderid =?', [orderid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Order record deleted ...!!' });
        } else {
            console.log(error);
        }
    });
});

module.exports=router7;