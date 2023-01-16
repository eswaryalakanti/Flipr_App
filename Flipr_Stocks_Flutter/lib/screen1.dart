import 'package:flutter/material.dart';
import 'package:hackathon_stock/chart.dart';
import 'package:hackathon_stock/drawer.dart';
import 'package:hackathon_stock/overview.dart';
import 'package:hackathon_stock/stocklist.dart';
import 'package:provider/provider.dart';

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
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
      }).then((_) {
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
  void didChangeDependencies() {
    indcd();
    super.didChangeDependencies();
  }

  @override
  final list = [
    'Reliance',
    'Tata Steel',
    'Ashok Leyland',
    'Cipla',
    'Eicher Motors'
  ];
  final list2 = ['reliance', 'tatasteel', 'ashokley', 'cipla', 'eichermot'];
  String Valuechoose = 'Reliance';
  Widget build(BuildContext context) {
    final h = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.bottom -
            2) *
        0.7;
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: drawer(),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.bottom -
                            2) *
                        0.03,
                  ),
                  Container(
                    child: Builder(
                        builder: (context) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                      onPressed: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      icon: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 2)),
                                  child: DropdownButton(
                                    dropdownColor:
                                        Color.fromRGBO(40, 40, 40, 1),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    items: list.map((e) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          e.toString(),
                                        ),
                                        value: e,
                                      );
                                    }).toList(),
                                    hint: Text('select an item'),
                                    value: Valuechoose,
                                    onChanged: (val) {
                                      setState(() {
                                        Valuechoose = val.toString();
                                        status["name"] =
                                            list2[list.indexOf(Valuechoose)];
                                        status["loaded"] = false;
                                        loading = true;
                                        indcd();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )),
                  ),
                  Container(
                    width: double.infinity,
                    child: charts(
                        list: stocks,
                        startdate: status["start"] as DateTime,
                        enddate: status["end"] as DateTime,
                        min: status["min"] as double,
                        max: status["max"] as double),
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
