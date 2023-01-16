import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_stock/chart.dart';
import 'package:hackathon_stock/drawer.dart';
import 'package:hackathon_stock/overview.dart';
import 'package:hackathon_stock/screen1.dart';
import 'package:hackathon_stock/stocklist.dart';
import 'package:hackathon_stock/stocklist.dart';

import 'package:provider/provider.dart';

class stock extends StatefulWidget {
  const stock({Key? key}) : super(key: key);

  @override
  State<stock> createState() => _stockState();
}

class _stockState extends State<stock> {
  var loading = true;

  var stocks;
  int selected_index = 0;
  var status = {
    "name": "nse",
    "loaded": false,
    "start": DateTime.parse("2023-01-12").subtract(Duration(days: 365)),
    "end": DateTime.parse("2023-01-12"),
    "max": 0,
    "min": 0,
  };
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final pages = [];
  void indcd() {
    if (!(status["loaded"] as bool)) {
      Provider.of<items>(context, listen: false)
          .loadData(status["name"] as String, status["start"] as DateTime,
              status["end"] as DateTime)
          .then((_) async {
        status["max"] = await Provider.of<items>(context, listen: false)
            .loadMax(status["name"] as String, status["start"] as DateTime,
                status["end"] as DateTime);
        status["min"] = await Provider.of<items>(context, listen: false)
            .loadMin(status["name"] as String, status["start"] as DateTime,
                status["end"] as DateTime);
        print("then");
        if (this.mounted) {
          setState(() {
            stocks = Provider.of<items>(context, listen: false)
                .stockm[status["name"]];
            loading = false;
          });
        }
      });
      status["loaded"] = true;
    }
  }

  @override
  void dispose() {
    this.loading = false;
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    indcd();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final h = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.bottom -
            2) *
        0.7;
    return Scaffold(
      drawer: drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_index,
        backgroundColor: Color.fromRGBO(40, 40, 40, 1),
        unselectedItemColor: Colors.white,
        unselectedFontSize: 18,
        selectedFontSize: 22,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              null,
              size: 10,
            ),
            label: 'NSE',
            tooltip: 'NSE',
          ),
          BottomNavigationBarItem(
              label: 'BSE',
              icon: Icon(
                null,
                size: 10,
              ),
              tooltip: 'BSE'),
        ],
        onTap: (index) {
          setState(() {
            selected_index = index;
            if (index == 0) {
              status["name"] = "nse";
            } else {
              status["name"] = "bse";
            }
            status["loaded"] = false;
            loading = true;
            indcd();
          });
        },
      ),
      backgroundColor: Colors.black,
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.bottom -
                            2) *
                        0.03,
                  ),
                  Builder(
                      builder: (context) => Container(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          )),
                  Container(
                    width: double.infinity,
                    child: charts(
                        list: stocks,
                        startdate: status["start"] as DateTime,
                        enddate: status["end"] as DateTime,
                        max: status["max"] as double,
                        min: status["min"] as double),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  overview(list: stocks),
                ],
              ),
            ),
    );
  }
}
