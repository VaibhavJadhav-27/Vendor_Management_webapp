var Router = require('express')
const router2=Router();

const mysqlConnection = require('../database/database');
router2.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});


module.exports=router2;