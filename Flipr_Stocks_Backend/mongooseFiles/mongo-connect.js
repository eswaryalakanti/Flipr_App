var mongoose = require("mongoose");
mongoose.connect("mongodb+srv://Rohan:fliprHack@cluster0.nljcoos.mongodb.net/Flipr?retryWrites=true&w=majority").then(()=>console.log("Connected to Db"));
module.exports={mongoose}; 