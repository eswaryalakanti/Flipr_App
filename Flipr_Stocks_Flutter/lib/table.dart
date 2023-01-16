import 'package:flutter/material.dart';

class TABLES extends StatefulWidget {
  List<Map<String, Object>> info;
  int len;
  TABLES(this.info, this.len);
  @override
  State<TABLES> createState() => _TableState();
}

class _TableState extends State<TABLES> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 56,
        columns: [
          DataColumn(
            label: Text(
              'Open price\n in \$',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Closed price\n in \$',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Highest price\n in \$',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Lowest price\n in \$',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 1]["date"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 1]["open"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 1]["close"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 1]["high"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 1]["low"].toString()
                  : '')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 2]["date"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 2]["open"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 2]["close"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 2]["high"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 2]["low"].toString()
                  : '')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 3]["date"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 3]["open"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 3]["close"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 3]["high"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 3]["low"].toString()
                  : '')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 4]["date"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 4]["open"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 4]["close"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 4]["high"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 4]["low"].toString()
                  : '')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 5]["date"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 5]["open"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 5]["close"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 5]["high"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 5]["low"].toString()
                  : '')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 6]["date"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 6]["open"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 6]["close"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 6]["high"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 6]["low"].toString()
                  : '')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 7]["date"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 7]["open"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 7]["close"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 7]["high"].toString()
                  : '')),
              DataCell(Text(widget.len > 0
                  ? widget.info[widget.len - 7]["low"].toString()
                  : '')),
            ],
          )
        ],
      ),
    );
  }
}
