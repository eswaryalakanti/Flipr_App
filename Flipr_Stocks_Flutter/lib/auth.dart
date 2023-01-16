import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_stock/stock.dart';

import 'auths.dart';

class auth extends StatefulWidget {
  const auth({Key? key}) : super(key: key);

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  var isload = false;

  void submit(String email, String password, bool islogin, String username,
      BuildContext context) async {
    setState(() {
      isload = true;
    });
    UserCredential user;
    try {
      if (islogin) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        await FirebaseFirestore.instance
            .collection('listofusers')
            .doc(user.user!.uid.toString())
            .set({'username': username, 'email': email});
      }
    } catch (error) {
      //on PlatformException
      setState(() {
        isload = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('stock market'),
      // ),
      backgroundColor: Colors.black,
      body: auths(
        isload: isload,
        submit: submit,
      ),
    );
  }
}
