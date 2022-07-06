var Router = require('express')
const router5=Router();

const mysqlConnection = require('../database/database');
router5.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

module.exports=router5;