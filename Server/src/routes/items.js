var Router = require('express')
const router6=Router();

const mysqlConnection = require('../database/database');
router6.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

module.exports=router6;