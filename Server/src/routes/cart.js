var Router = require('express');
const router9 = Router();

const mysqlConnection = require('../database/database');

router9.get('/', async(req, res) => {
    res.status(200).json('Server is on and database is connected..!!!');
});

router9.get('/:cart', async(req, res) => {
    mysqlConnection.query('select * from cart ;', (error, rows, fields) => {
        if (!error) {
            res.json(rows);
            console.log(rows);

        } else {
            console.log(error);
        }
    });
});

router9.get('/:cart/:custid', async(req, res) => {
    var custid = req.params.custid;
    console.log(custid);
    mysqlConnection.query('select * from cart where custid=? ;', [custid], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
            console.log(rows);

        } else {
            console.log(error);
        }
    });
});

router9.get('/:cart/:custid/:itemid', async(req, res) => {
    var itemid = req.params.itemid;
    var custid = req.params.custid;
    console.log(itemid);
    mysqlConnection.query('select * from cart where itemid=? and custid=? ;', [itemid,custid], (error, rows, fields) => {
        if (!error) {
            
            res.json(rows);
            console.log(rows);

        } else {
            console.log(error);
        }
    });
});


router9.post('/:cart', (req, res) => {
    var custid = req.body.custid;
    var itemid = req.body.itemid;
    var vendorid = req.body.vendorid
    var itemname = req.body.itemname;
    var itemimage = req.body.itemimage;
    var itemprice = req.body.price;
    var itemquantity = req.body.mquantity;
    var totalprice = req.body.totalprice;
    console.log(custid);
    console.log(itemid);
    console.log(vendorid);
    console.log(itemname);
    console.log(itemimage);
    console.log(itemprice);
    console.log(itemquantity);
    console.log(totalprice);
    mysqlConnection.query('insert into cart values(?,?,?,?,?,?,?,?);', [custid, itemid, vendorid, itemname, itemimage, itemprice, itemquantity, totalprice], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Customer registered ..!!' });
            res.send('cart record inserted successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send("Duplicate entries..!!!");
        }
    });

});

router9.put('/:cart', (req, res) => {
    var custid = req.body.custid;
    var itemid = req.body.itemid;
    var itemprice = req.body.price;
    var itemquantity = req.body.mquantity;
    var totalprice = req.body.totalprice;
    console.log(custid);
    console.log(itemid);
    console.log(itemprice);
    console.log(itemquantity);
    console.log(totalprice);
    mysqlConnection.query('update cart set price = ?, mquantity=?, totalprice=? where itemid = ? and custid=?', [itemprice,itemquantity,totalprice, itemid,custid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Cart data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});


router9.delete('/:cart/delete/:custid/:itemid', (req, res) => {
    var itemid = req.params.itemid;
    var custid = req.params.custid;
    console.log(custid);
    console.log(itemid);
    mysqlConnection.query('delete from cart where custid =? and itemid=?', [ custid,itemid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Cart item deleted ...!!' });
        } else {
            console.log(error);
        }
    });
})

module.exports = router9;