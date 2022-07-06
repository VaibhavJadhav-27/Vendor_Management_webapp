const express=require('express')

const app=express()
const cors=require('cors')
const login = require('./routes/login');
const admin = require('./routes/admin');
const customer = require('./routes/customer');
const items =  require('./routes/items');
const orderdb = require('./routes/orders');
const query = require('./routes/query');
const staff = require('./routes/staff');
const vendor = require('./routes/vendor');


//Settings
app.set('port',process.env.PORT || 4000);


//Middlewares
app.use(express.json());
app.use(cors());


//Routes
app.use('/login',login);
app.use('/admin',admin);
app.use('/customer',customer);
app.use('/items',items);
app.use('/orderdb',orderdb);
app.use('/query',query);
app.use('/staff',staff);
app.use('/vendor',vendor);


//Starting server
app.listen(app.get('port'),()=>{
    console.log('Server is running on port ',app.get('port'));
});