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

module.exports=router1;
