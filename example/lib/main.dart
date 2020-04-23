import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_locker/flutter_locker.dart';
import 'package:flutter_locker/gen/protos/flutter_locker.pb.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String key = 'pwdkey';
  String secret = '1111';

  Future<void> _canAuthenticate(BuildContext context) async {
    FlutterLocker.canAuthenticate().then((value) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Can authenticate: ' + value.toString())));
    }).catchError((err) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error happened: ' + err.toString())));
    });
  }

  Future<void> _saveSecret(BuildContext context) async {
    FlutterLocker.save(SaveSecretRequest(key, secret, AndroidPrompt("Authenticate", "Cancel"))).then((value) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Successfully Saved Secret: $secret')));
    }).catchError((err) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error happened: ' + err.toString())));
    });
  }

  Future<void> _retrieveSecret(BuildContext context) async {
    FlutterLocker.retrieve(
            RetrieveSecretRequest(key, AndroidPrompt("Authenticate", "Cancel"), IOsPrompt("Authenticate")))
        .then((value) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Retrieved secret: ' + value)));
    }).catchError((err) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error happened: ' + err.toString())));
    });
  }

  Future<void> _deleteSecret(BuildContext context) async {
    FlutterLocker.delete(key).then((value) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Secret deleted.')));
    }).catchError((err) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error happened: ' + err.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Text('Goldilocks finger example'),
          ),
          SizedBox(height: 20),
          CupertinoButton.filled(
              child: Text("Can authenticate"),
              onPressed: () {
                _canAuthenticate(context);
              }),
          SizedBox(height: 20),
          CupertinoButton.filled(
              child: Text("Save"),
              onPressed: () {
                _saveSecret(context);
              }),
          SizedBox(height: 20),
          CupertinoButton.filled(
              child: Text("Retrieve"),
              onPressed: () {
                _retrieveSecret(context);
              }),
          SizedBox(height: 20),
          CupertinoButton.filled(
              child: Text("Delete"),
              onPressed: () {
                _deleteSecret(context);
              })
        ],
      ),
    );
  }
}
