var {mongoose} = require("./mongooseFiles/mongo-connect");
var {Ashokley, BSE, Cipla, Eichermot, Nse, Reliance, Tatasteel} = require("./mongooseFiles/models");
var bodyparser = require("body-parser");
var express = require("express");
var app = express();
app.use(bodyparser.json());
const models={"ashokley":Ashokley, "bse":BSE, "cipla":Cipla, "eichermot":Eichermot, "nse":Nse, "reliance":Reliance, "tatasteel":Tatasteel};

app.get('/date/:name/:date',(req, res)=>{
    const m = models[req.params.name];
    const date=req.params.date;
    m.findOne({Date:date}).then((doc)=>{
        res.status(200).send(doc);             
    },(err)=>{
        res.status(400).send({"error":err});
    });
});
app.get('/daterange/:name/:date1/:date2',(req, res)=>{
    const m = models[req.params.name];
    const date1=req.params.date1;
    const date2=req.params.date2;
    m.find({Date:{
        $gte: date1,
        $lte: date2}}).then((doc)=> {
            console.log(doc);
        res.status(200).send(doc);
    },(err)=>{
        res.status(400).send({"error":err});
    });
});
app.get('/over/:name/:date1/:date2/:sc',(req, res)=>{
    const m = models[req.params.name];
    const date1=req.params.date1;
    const date2=req.params.date2;
    const sc=req.params.sc;
    m.find({Date:{
        $gte: date1,
        $lte: date2}}).sort({Open : sc}).limit(1).then((doc)=>{
            console.log(doc);
        res.status(200).send(doc[0]);
    },(err)=>{
        res.status(400).send({"error":err});
    });
});
app.listen(process.env.PORT || 60900,  ()=>{
    console.log("server connected on port 60900.");
});