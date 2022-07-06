var Router = require('express')
const router5=Router();

const mysqlConnection = require('../database/database');
router5.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

router5.get('/:vendor', (req, res) => {
    mysqlConnection.query('select * from vendor;', (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router5.get('/:vendor/:vendorfname/:vendorlname', (req, res) => {
    var vendorfname = req.params.vendorfname;
    var vendorlname = req.params.vendorlname;
    console.log(vendorfname);
    console.log(vendorlname);
    mysqlConnection.query('select * from vendor where vendorfname = ? and vendorlname = ?;',[vendorfname,vendorlname], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router5.post('/:vendor', (req, res) => {
    var id = req.body.vendorid;
    var fname = req.body.vendorfname;
    var lname = req.body.vendorlname;
    var email = req.body.emailid;
    var phone = req.body.contactno;
    var residence = req.body.residence;
    console.log(id);
    console.log(fname);
    console.log(lname);
    console.log(email);
    console.log(phone);
    console.log(residence);
    mysqlConnection.query('insert into vendor values(?,?,?,?,?,?);', [id, fname, lname, residence, phone, email,], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Vendor registered ..!!' });
            res.send('Vendor Registered successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send("Duplicate entries..!!!");
        }
    });

});

router5.put('/:vendor', (req, res) => {
    var fname = req.body.vendorfname;
    var lname = req.body.vendorlname;
    var email = req.body.emailid;
    var phone = req.body.contactno;
    var residence = req.body.residence;
    //console.log(id);
    console.log(fname);
    console.log(lname);
    console.log(email);
    console.log(phone);
    console.log(residence);
    mysqlConnection.query('update vendor set emailid=?, contactno =?, residence =? where vendorfname = ? and vendorlname = ?', [email, phone, residence, fname,lname], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Vendor data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});

router5.delete('/vendor', (req, res) => {
    var vendorid = req.body.vendorid;
    console.log(vendorid);
    mysqlConnection.query('delete from vendor where vendorid =?', [vendorid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Vendor record deleted ...!!' });
        } else {
            console.log(error);
        }
    });
});


module.exports=router5;