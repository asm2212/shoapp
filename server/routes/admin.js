const express = require("express");
adminRouter = express.Router();
const admin = require("../middlewares/admin");
const Product = require("../models/product");

adminRouter.post("/admin/add-product",admin,async(req,res) => {
  try {
    const {name,description,images,quantity,price,category} = req.body;
    const product = new Product({
        name,
        description,
        images,
        quantity,
        price,
        category
    });
    await product.save();
    res.status(201).json({message: "Product added successfully"});
  } catch (error) {
    res.status(500).json({error:error.message});
  }
});

module.exports = adminRouter;