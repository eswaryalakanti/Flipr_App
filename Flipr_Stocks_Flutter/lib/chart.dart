import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hackathon_stock/linetile.dart';
import 'package:hackathon_stock/stocklist.dart';
import 'package:intl/intl.dart';

class charts extends StatelessWidget {
  final DateTime startdate, enddate;
  final double min, max;
  final List<stocks> list;
  charts(
      {Key? key,
      required this.list,
      required this.startdate,
      required this.enddate,
      required this.min,
      required this.max})
      : super(key: key);
  final List<Color> gradient = [Colors.greenAccent, Colors.red];

  @override
  Widget build(BuildContext context) {
    final sorted =
        list.sort((v1, v2) => v1.dateTime.isAfter(v2.dateTime) ? -1 : 1);
    final spots = list.map((stock) {
      return FlSpot(
          stock.dateTime.millisecondsSinceEpoch.toDouble(), stock.open);
    }).toList();
    final len = list.length;
    return Column(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          color: Colors.black,
          padding: EdgeInsets.only(left: 10),
          child: LineChart(LineChartData(
              backgroundColor: Colors.black,
              minX: startdate.millisecondsSinceEpoch.toDouble(),
              maxX: enddate.millisecondsSinceEpoch.toDouble(),
              minY: min,
              maxY: max,
              titlesData: FlTitlesData(
                  rightTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, v) =>
                          TextStyle(color: Colors.white)),
                  show: true,
                  topTitles: SideTitles(
                    showTitles: false,
                  ),
                  bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'jn';
                          case 5:
                            return 'may';
                          case 7:
                            return 'july';
                          case 9:
                            return 'sep';
                          default:
                            return '';
                        }
                      }),
                  leftTitles: SideTitles(
                      showTitles: false,
                      interval: 1,
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 1:
                            return '100';
                          case 3:
                            return '1K';
                          case 5:
                            return '3k';
                          case 6:
                            return '10K';
                          default:
                            return '';
                        }
                      })),
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.3),
                    strokeWidth: 1,
                  );
                },
                drawVerticalLine: true,
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.3),
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.white, width: 1)),
              lineBarsData: [
                LineChartBarData(
                    spots: spots,
                    isCurved: false,
                    colors: gradient,
                    dotData: FlDotData(
                        show: false), //if you do not want to see the graph
                    barWidth: 1,
                    belowBarData: BarAreaData(
                      colors: gradient.map((e) => e.withOpacity(0.3)).toList(),
                      show: true,
                    ))
              ])),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              DateFormat.yMd().format(startdate),
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '-',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            Text(
              DateFormat.yMd().format(enddate),
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Text(
          'OverView',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}
