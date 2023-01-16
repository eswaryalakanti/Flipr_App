import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(40, 40, 40, 1),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.rectangle),
            height: 150,
            margin: EdgeInsets.only(top: 75, bottom: 20),
            child: ClipRRect(
              child: Image.asset(
                'images/stock-market.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // CircleAvatar(
          //   radius: 35,
          //   child: ClipRRect(
          //     child: Image.asset('images/stock-market.png'),
          //   ),
          // ),
          ListTile(
            leading: Text('NSE/BSE',
                style: TextStyle(fontSize: 30, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pushNamed('/s1');
            },
          ),
          ListTile(
            leading: Text(
              'Companies',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/s2');
            },
          ),
          ListTile(
            leading: Text(
              'Log-Out',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
