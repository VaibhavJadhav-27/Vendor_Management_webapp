var Router = require('express')
const router1=Router();

const mysqlConnection = require('../database/database');
router1.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});


router1.get('/:login',async(req,res) => {
    mysqlConnection.query('select * from login;',(error,rows,fields) => {
        if(!error){
            res.json(rows);
        }
        else{
            console.log(error);
        }
    });
});

router1.get('/:login/:emailid/:password', async(req, res) => {
    var email = req.params.emailid;
    var password = req.params.custpassword;
    console.log(email);
    console.log(password);
    mysqlConnection.query('select * from login where emailid = ? and password =? ;', [email, password], (error, rows, fields) => {
        if (!error) {
            if(rows.length==0){
                res.json("NO entries");
                console.log("NO entries");
            }
            else{
                res.json(rows);
                console.log(rows);
    
            }

        } else {
            console.log(error);
        }
    });
});

router1.post('/:login', (req, res) => {
    var email = req.body.emailid;
    var pass = req.body.password;
    var logintype = req.body.logintype;
    console.log(email);
    console.log(logintype);
    console.log(pass);
    mysqlConnection.query('insert into login values(?,?,?);', [email, pass, logintype], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Customer registered ..!!' });
            res.send('Login Registered successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send("Duplicate entries..!!!");
        }
    });

});

router1.put('/:login', (req, res) => {
    var email = req.body.emailid;
    var pass = req.body.password;
    var logintype = req.body.logintype;
    console.log(email);
    console.log(logintype);
    console.log(pass);
    mysqlConnection.query('update login set custemail=?, custpassword =?, status = ? where custemail = ?', [email, pass, logintype, email], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Login data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});

router1.delete('/login/:emailid', (req, res) => {
    var email = req.params.emailid;
    console.log(email);
    mysqlConnection.query('delete from login where custemail =?', [email], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Login record deleted ...!!' });
        } else {
            console.log(error);
        }
    });
})


module.exports=router1;
