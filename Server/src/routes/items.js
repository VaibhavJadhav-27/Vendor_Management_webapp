var Router = require('express')
const router6=Router();

const mysqlConnection = require('../database/database');
router6.get('/',async(req,res)=> {
    res.status(200).json('Server is on and database is connected..!!!');
});

router6.get('/:items', async(req, res) => {
    mysqlConnection.query('select * from items;', (error, rows, fields) => {
        if (!error) {
            res.json(rows);
        } else {
            console.log(error);
        }
    });
});

router6.get('/:items/:itemname', async(req, res) => {
    var itemname = req.params.itemname;
    console.log(itemname);
    mysqlConnection.query('select * from items where itemname=? ;', [itemname], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
            console.log(rows);

        } else {
            console.log(error);
        }
    });
});

router6.get('/:items/itemname/:category', async(req, res) => {
    var category = req.params.category;
    console.log(category);
    mysqlConnection.query('select * from items where category=? ;', [category], (error, rows, fields) => {
        if (!error) {
            res.json(rows);
            console.log(rows);

        } else {
            console.log(error);
        }
    });
});

router6.post('/:items', (req, res) => {
    var itemid = req.body.itemid;
    var itemname = req.body.itemname;
    var itemprice = req.body.price;
    var itemcategory = req.body.category;
    var mquantity = req.body.mquantity;
    var vendorid = req.body.vendorid;
    var itemimage = req.body.itemimage;
    
    console.log(itemid);
    console.log(itemname);
    console.log(itemprice);
    console.log(itemcategory);
    console.log(mquantity);
    console.log(vendorid);
    console.log(itemimage);
    
    mysqlConnection.query('insert into items values(?,?,?,?,?,?,?);', [itemid, itemname, itemprice, itemcategory, mquantity, vendorid, itemimage], (error, rows, fields) => {
        if (!error) {
            //res.json({ Status: 'Customer registered ..!!' });
            res.send('Items record inserted successfully...!!!')

        } else {
            console.log(res.statusCode);
            console.log(error);
            res.send("Duplicate entries..!!!");
        }
    });

});

router6.put('/:items', (req, res) => {
    var itemid = req.body.itemid;
    var itemname = req.body.itemname;
    var itemprice = req.body.price;
    console.log(itemid);
    console.log(itemname);
    console.log(itemprice);
    mysqlConnection.query('update items set itemname=?, price = ? where itemid = ?', [itemname, itemprice, itemid], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Items data updated ..!!' });

        } else {
            console.log(error);
        }
    });
});

router6.delete('/items', (req, res) => {
    var itemname = req.body.itemname;
    console.log(custid);
    mysqlConnection.query('delete from items where itemname =?', [itemname], (error, rows, fields) => {
        if (!error) {
            res.json({ Status: 'Item deleted ...!!' });
        } else {
            console.log(error);
        }
    });
})

module.exports=router6;