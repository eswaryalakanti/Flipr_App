import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon_stock/auth.dart';
import 'package:hackathon_stock/list.dart';
import 'package:hackathon_stock/screen1.dart';
import 'package:hackathon_stock/stock.dart';
import 'package:hackathon_stock/stocklist.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          return MultiProvider(
            providers: [ChangeNotifierProvider.value(value: items())],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                accentColor: Colors.white,
                primaryColor: Colors.white,
              ),
              home: snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : StreamBuilder(
                      builder: (context, snap) {
                        print('ex');
                        if (snap.hasData) {
                          return stock();
                        } else {
                          return auth();
                        }
                      },
                      stream: FirebaseAuth.instance.authStateChanges(),
                    ),
              routes: {
                '/s1': (context) => stock(),
                '/s2': (context) => screen1(),
              },
            ),
          );
        });
  }
}
