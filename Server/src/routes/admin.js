var Router = require('express')
const router2=Router();

const mysqlConnection = require('../database/database');
router2.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

router2.get('/:admin', (req, res) => {
    mysqlConnection.query('select * from admin;', (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router2.get('/:admin/:adminfname/:adminlname', (req, res) => {
    var adminfname = req.params.adminfname;
    var adminlname = req.params.adminlname;
    console.log(adminfname);
    console.log(adminlname);
    mysqlConnection.query('select * from admin where adminfname = ? and adminlname = ?;',[adminfname,adminlname], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router2.post('/:admin', (req, res) => {
    var id = req.body.adminid;
    var fname = req.body.adminfname;
    var lname = req.body.adminlname;
    var email = req.body.emailid;
    var phone = req.body.contactno;
    console.log(id);
    console.log(fname);
    console.log(lname);
    console.log(email);
    console.log(phone);
    mysqlConnection.query('insert into admin values(?,?,?,?,?);', [id, fname,lname, phone, email], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Customer registered ..!!' });
            res.send('Admin Registered successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send("Duplicate entries..!!!");
        }
    });

});

router2.put('/:admin', (req, res) => {
    var fname = req.body.adminfname;
    var lname = req.body.adminlname;
    var email = req.body.emailid;
    var phone = req.body.contactno;
    //console.log(id);
    console.log(fname);
    console.log(lname);
    console.log(email);
    console.log(phone);
    mysqlConnection.query('update admin set emailid=?, contactno =? where adminfname = ? and adminlname = ?', [email, phone, fname,lname], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Admin data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});

router2.delete('/admin', (req, res) => {
    var adminid = req.body.adminid;
    console.log(adminid);
    mysqlConnection.query('delete from admin where adminid =?', [adminid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Admin record deleted ...!!' });
        } else {
            console.log(error);
        }
    });
});


module.exports=router2;