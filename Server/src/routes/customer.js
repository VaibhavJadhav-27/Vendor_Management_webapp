var Router = require('express')
const router3=Router();

const mysqlConnection = require('../database/database');
router3.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

router3.get('/:customer', (req, res) => {
    mysqlConnection.query('select * from customer;', (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router3.get('/:customer/:custfname/:custlname', (req, res) => {
    var custfname = req.params.custfname;
    var custlname = req.params.custlname;
    console.log(custfname);
    console.log(custlname);
    mysqlConnection.query('select * from customer where custfname = ? and custlname = ?;',[custfname,custlname], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router3.get('/:customer/:emailid', (req, res) => {
    var emailid = req.params.emailid;
    console.log(emailid);
    mysqlConnection.query('select * from customer where emailid = ?;',[emailid], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router3.post('/:customer', (req, res) => {
    var id = req.body.custid;
    var fname = req.body.custfname;
    var lname = req.body.custlname;
    var email = req.body.emailid;
    var phone = req.body.contactno;
    var residence = req.body.residence;
    console.log(id);
    console.log(fname);
    console.log(lname);
    console.log(email);
    console.log(phone);
    console.log(residence);
    mysqlConnection.query('insert into customer values(?,?,?,?,?,?);', [id, fname,lname, phone, email, residence], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Customer registered ..!!' });
            res.send('Customer Registered successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send("Duplicate entries..!!!");
        }
    });

});

router3.put('/:customer', (req, res) => {
    var fname = req.body.custfname;
    var lname = req.body.custlname;
    var email = req.body.emailid;
    var phone = req.body.contactno;
    var residence = req.body.residence;
    //console.log(id);
    console.log(fname);
    console.log(lname);
    console.log(email);
    console.log(phone);
    console.log(residence);
    mysqlConnection.query('update customer set emailid=?, contactno =?, residence =? where custfname = ? and custlname = ?', [email, phone, residence, fname,lname], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Customer data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});

router3.delete('/customer', (req, res) => {
    var custid = req.body.custid;
    console.log(custid);
    mysqlConnection.query('delete from customer where custid =?', [custid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Customer record deleted ...!!' });
        } else {
            console.log(error);
        }
    });
});


module.exports=router3;