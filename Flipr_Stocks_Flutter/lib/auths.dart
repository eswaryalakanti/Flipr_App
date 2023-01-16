import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon_stock/stock.dart';

class auths extends StatefulWidget {
  Function submit;
  bool isload;
  auths({required this.isload, required this.submit});

  @override
  State<auths> createState() => _authsState();
}

class _authsState extends State<auths> {
  String email = '';
  String password = '';
  String username = '';
  bool islogin = true;
  final formkey = GlobalKey<FormState>();
  void submit() async {
    if (formkey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      formkey.currentState!.save();
      widget.submit(email, password, islogin, username, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  key: ValueKey('email'),
                  onSaved: (v) {
                    email = v.toString();
                  },
                  validator: (v) {
                    if (v.toString().isEmpty || !v.toString().contains('@')) {
                      return 'the email entered is not a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 2),
                        borderRadius: BorderRadius.circular(32)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlueAccent, width: 2),
                        borderRadius: BorderRadius.circular(32)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlue, width: 4),
                        borderRadius: BorderRadius.circular(32)),
                    labelText: 'Email-Address',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    hintText: 'Enter the Email',
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                if (!islogin)
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    key: ValueKey('name'),
                    onSaved: (v) {
                      username = v.toString();
                    },
                    validator: (v) {
                      if (v.toString().isEmpty || v.toString().length < 3) {
                        return 'please enter the name greater than 4 characters';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 2),
                            borderRadius: BorderRadius.circular(32)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 2),
                            borderRadius: BorderRadius.circular(32)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 4),
                            borderRadius: BorderRadius.circular(32)),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        hintText: 'Enter the username'),
                  ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  key: ValueKey('pas'),
                  onSaved: (v) {
                    password = v.toString();
                  },
                  validator: (v) {
                    if (v.toString().isEmpty || v.toString().length < 3) {
                      return ' please enter the valid password';
                    }
                    return null;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 2),
                          borderRadius: BorderRadius.circular(32)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 2),
                          borderRadius: BorderRadius.circular(32)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.lightBlue, width: 4),
                          borderRadius: BorderRadius.circular(32)),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      hintText: 'Enter the password'),
                ),
                SizedBox(
                  height: 12,
                ),
                if (widget.isload)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (!widget.isload)
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    color: Colors.black,
                    elevation: 5,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        islogin ? 'Log In' : 'SignUp',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: submit,
                    ),
                  ),
                SizedBox(
                  height: 6,
                ),
                if (widget.isload)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (!widget.isload)
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    color: Colors.black,
                    elevation: 5,
                    child: MaterialButton(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        16,
                      )),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        islogin
                            ? 'dont have account'
                            : 'i already have an account',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          islogin = !islogin;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
