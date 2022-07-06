var Router = require('express')
const router8=Router();

const mysqlConnection = require('../database/database');
router8.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

router8.get('/:queries', (req, res) => {
    mysqlConnection.query('select * from queries;', (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router8.get('/:queries/:queryid', (req, res) => {
    var queryid = req.params.queryid;
    console.log(queryid);
    mysqlConnection.query('select * from queries where queryid = ?;',[queryid], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router8.get('/:queries/queryid/:vendorid', (req, res) => {
    var vendorid = req.params.vendorid;
    console.log(vendorid);
    mysqlConnection.query('select * from queries where vendorid = ?;',[vendorid], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router8.post('/:queries', (req, res) => {
    var queryid = req.body.queryid;
    var vendorid = req.body.vendorid;
    var querydetails = req.body.querydetails;
    var qtime = req.body.qtime;
    var status = req.body.status;
    console.log(queryid);
    console.log(vendorid);
    console.log(querydetails);
    console.log(qtime);
    console.log(status);
    mysqlConnection.query('insert into queries values(?,?,?,?,?);', [queryid, vendorid,querydetails, qtime, status], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Customer registered ..!!' });
            res.send('Query Registered successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send("Duplicate entries..!!!");
        }
    });

});

router8.put('/:queries', (req, res) => {
    var queryid = req.body.queryid;
    var status = req.body.status;
    //console.log(id);
    console.log(queryid);
    console.log(status);
    mysqlConnection.query('update queries set status =? where queryid = ?', [status,queryid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Queries data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});

router8.delete('/queries', (req, res) => {
    var queryid = req.body.queryid;
    console.log(queryid);
    mysqlConnection.query('delete from queries where queryid =?', [queryid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Query record deleted ...!!' });
        } else {
            console.log(error);
        }
    });
});

module.exports=router8;