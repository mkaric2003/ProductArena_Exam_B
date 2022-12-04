//IMPORT FROM PACKAGES
const express = require('express'); //import 'package:express/express.dart'
const mongoose = require('mongoose');
//IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth');

//const userRouter = require('./routes/user');
//INIT
const PORT = 3000;
const app = express();
const DB = 'mongodb+srv://mirza:mirza123@cluster0.stl2z0m.mongodb.net/?retryWrites=true&w=majority';
//middleware
app.use(express.json());
app.use(authRouter);
//app.use(userRouter);

//connections
mongoose.connect(DB)
.then(() => {
    console.log('Connection successful');
}) 
.catch((e)=> {
    console.log(e);
})





app.listen(PORT , "0.0.0.0", ()=>{
    console.log(`connected at port ${PORT}`);
});