var mongoose = require("mongoose");

const Nse = mongoose.model("Nse", {
    Date: Date,
    Open: Number,
    High: Number,
    Low: Number,
    Close: Number,
    AdjClose: Number
});
const BSE = mongoose.model("BSE", {
    Date: Date,
    Open: Number,
    High: Number,
    Low: Number,
    Close: Number,
    AdjClose: Number
});
const Ashokley = mongoose.model("Ashokley", {
    Date: Date,
    Open: Number,
    High: Number,
    Low: Number,
    Close: Number,
    AdjClose: Number
});
const Cipla = mongoose.model("Cipla", {
    Date: Date,
    Open: Number,
    High: Number,
    Low: Number,
    Close: Number,
    AdjClose: Number
});
const Eichermot = mongoose.model("Eichermot", {
    Date: Date,
    Open: Number,
    High: Number,
    Low: Number,
    Close: Number,
    AdjClose: Number
});
const Reliance = mongoose.model("Reliance", {
    Date: Date,
    Open: Number,
    High: Number,
    Low: Number,
    Close: Number,
    AdjClose: Number
});
const Tatasteel = mongoose.model("Tatasteel", {
    Date: Date,
    Open: Number,
    High: Number,
    Low: Number,
    Close: Number,
    AdjClose: Number
});
module.exports={Ashokley, BSE, Cipla, Eichermot, Nse, Reliance, Tatasteel };