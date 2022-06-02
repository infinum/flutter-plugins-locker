import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locker/flutter_locker.dart';
import 'package:flutter_locker/gen/locker_api.gen.dart';

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

  Future<void> _canAuthenticate() async {
    try {
      final canAuthenticate = await FlutterLocker.canAuthenticate();

      _showMessage('Can authenticate: $canAuthenticate');
    } on Exception catch (exception) {
      _showErrorMessage(exception);
    }
  }

  Future<void> _saveSecret() async {
    try {
      await FlutterLocker.save(
        SaveSecretRequest(
            key: key, secret: secret, androidPrompt: AndroidPrompt(title: 'Authenticate', cancelLabel: 'Cancel')),
      );

      _showMessage('Secret saved, secret: $secret');
    } on Exception catch (exception) {
      _showErrorMessage(exception);
    }
  }

  Future<void> _retrieveSecret() async {
    try {
      final retrieved = await FlutterLocker.retrieve(RetrieveSecretRequest(
          key: key,
          androidPrompt: AndroidPrompt(title: 'Authenticate', cancelLabel: 'Cancel'),
          iOsPrompt: IOsPrompt(touchIdText: 'Authenticate')));

      _showMessage('Secret retrieved, secret: $retrieved');
    } on Exception catch (exception) {
      _showErrorMessage(exception);
    }
  }

  Future<void> _deleteSecret() async {
    try {
      await FlutterLocker.delete(key);

      _showMessage('Secret deleted');
    } on Exception catch (exception) {
      _showErrorMessage(exception);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showErrorMessage(Exception exception) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Something went wrong: $exception'), duration: Duration(days: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 100),
          Center(
            child: Text(
              'Locker example',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 40),
          CupertinoButton.filled(
            child: Text('Can authenticate'),
            onPressed: _canAuthenticate,
          ),
          SizedBox(height: 20),
          CupertinoButton.filled(
            child: Text('Save secret'),
            onPressed: _saveSecret,
          ),
          SizedBox(height: 20),
          CupertinoButton.filled(
            child: Text('Retrieve secret'),
            onPressed: _retrieveSecret,
          ),
          SizedBox(height: 20),
          CupertinoButton.filled(
            child: Text('Delete secret'),
            onPressed: _deleteSecret,
          )
        ],
      ),
    );
  }
}
