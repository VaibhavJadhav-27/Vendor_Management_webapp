var Router = require('express')
const router4=Router();

const mysqlConnection = require('../database/database');
router4.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

router4.get('/:staff', (req, res) => {
    mysqlConnection.query('select * from staff;', (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router4.get('/:staff/:stafffname/:stafflname', (req, res) => {
    var stafffname = req.params.stafffname;
    var stafflname = req.params.stafflname;
    console.log(stafffname);
    console.log(stafflname);
    mysqlConnection.query('select * from staff where stafffname = ? and stafflname = ?;',[stafffname,stafflname], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router4.get('/:staff/:emailid', (req, res) => {
    var emailid = req.params.emailid;
    console.log(emailid);
    mysqlConnection.query('select * from staff where emailid = ?;',[emailid], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router4.post('/:staff', (req, res) => {
    var id = req.body.staffid;
    var fname = req.body.stafffname;
    var lname = req.body.stafflname;
    var email = req.body.emailid;
    var phone = req.body.contactno;
    console.log(id);
    console.log(fname);
    console.log(lname);
    console.log(email);
    console.log(phone);
    mysqlConnection.query('insert into staff values(?,?,?,?,?);', [id, fname,lname, phone, email], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Customer registered ..!!' });
            res.send('Staff Registered successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send("Duplicate entries..!!!");
        }
    });

});

router4.put('/:staff', (req, res) => {
    var fname = req.body.stafffname;
    var lname = req.body.stafflname;
    var email = req.body.emailid;
    var phone = req.body.contactno;
    //console.log(id);
    console.log(fname);
    console.log(lname);
    console.log(email);
    console.log(phone);
    mysqlConnection.query('update staff set emailid=?, contactno =? where stafffname = ? and stafflname = ?', [email, phone, fname,lname], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Staff data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});

router4.delete('/staff', (req, res) => {
    var staffid = req.body.staffid;
    console.log(staffid);
    mysqlConnection.query('delete from staff where staffid =?', [staffid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Staff record deleted ...!!' });
        } else {
            console.log(error);
        }
    });
});


module.exports=router4;