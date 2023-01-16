import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class stocks {
  DateTime dateTime;
  double open;
  double close;
  double high;
  double low;
  double adj;
  double volume;
  stocks(
      {required this.dateTime,
      required this.close,
      required this.high,
      required this.low,
      required this.open,
      required this.adj,
      required this.volume});
}

class items with ChangeNotifier {
  Map<String, List<stocks>> stockm = {
    'reliance': [],
    'bse': [],
    'nse': [],
    'cipla': [],
    'ashokley': [],
    'eichermot': [],
    'tatasteel': []
  };
  Future<void> loadData(String name, DateTime start, DateTime end) async {
    print('hiii');
    var url = Uri.parse(
        'https://stockz-api.onrender.com/daterange/$name/${start.toString()}/${end.toString()}');
    print('twiter');
    var response = await http.get(url);
    print('url');
    var data = json.decode(response.body) as List<dynamic>;
    print(data);
    stockm[name] = data
        .map((e) => stocks(
            dateTime: DateTime.parse(e["Date"]),
            close: e["Close"].toDouble(),
            high: e["High"].toDouble(),
            low: e["Low"].toDouble(),
            open: e["Open"].toDouble(),
            volume: e["Volume"].toDouble(),
            adj: e["AdjClose"].toDouble()))
        .toList();
    print('jkl');
    notifyListeners();
  }

  Future<double> loadMax(String name, DateTime start, DateTime end) async {
    var url = Uri.parse(
        'https://stockz-api.onrender.com/over/$name/${start.toString()}/${end.toString()}/-1');
    var response = await http.get(url);
    var data = json.decode(response.body);
    return data["Open"].toDouble();
  }

  Future<double> loadMin(String name, DateTime start, DateTime end) async {
    var url = Uri.parse(
        'https://stockz-api.onrender.com/over/$name/${start.toString()}/${end.toString()}/1');
    var response = await http.get(url);
    var data = json.decode(response.body);
    print(data['Low']);
    return data["Open"].toDouble();
  }
}
