import 'package:flutter/material.dart';
import 'package:hackathon_stock/stocklist.dart';

class overview extends StatelessWidget {
  final List<stocks> list;
  const overview({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    list.sort((v1, v2) => v1.dateTime.isAfter(v2.dateTime) ? -1 : 1);
    final len = list.length;
    return Container(
      margin: EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 3)),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              'Open   - ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            trailing: Text(list[len - 1].open.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Divider(),
          ListTile(
            leading: Text('Close ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            trailing: Text('${list[len - 1].close.toString()}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Divider(),
          ListTile(
            leading: Text('Day High ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            trailing: Text('${list[len - 1].high.toString()}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Divider(),
          ListTile(
            leading: Text('Day Low ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            trailing: Text('${list[len - 1].low.toString()}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
