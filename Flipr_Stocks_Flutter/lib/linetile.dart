import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineTile {
  static lintile() {
    FlTitlesData(
        show: true,
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
            showTitles: true,
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
            }));
  }
}
