const express = require("express");
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const mongoose = require("mongoose");

const app = express();
PORT = 3000;
MONGO_DB = "mongodb://0.0.0.0:27017/shoapp";

app.use(express.json());
app.use(authRouter); 
app.use(adminRouter);
app.use(productRouter);

mongoose.connect(MONGO_DB, {
    
})
   .then(() => console.log("Connected to MongoDB"))
   .catch(err => console.log(err));


app.listen(PORT,"0.0.0.0" ,() => {
    console.log(`Server is running on port ${PORT}`);
});