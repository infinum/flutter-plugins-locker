import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locker/flutter_locker.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State createState() => _MyAppState();
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
            key: key,
            secret: secret,
            androidPrompt: AndroidPrompt(
                title: 'Authenticate',
                cancelLabel: 'Cancel',
                descriptionLabel: 'Please authenticate')),
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
          androidPrompt: AndroidPrompt(
              title: 'Authenticate',
              cancelLabel: 'Cancel',
              descriptionLabel: 'Please authenticate'),
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
      SnackBar(
        content: Text('Something went wrong: $exception'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 100),
          const Center(
            child: Text(
              'Locker example',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(height: 40),
          CupertinoButton.filled(
            onPressed: _canAuthenticate,
            child: const Text('Can authenticate'),
          ),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            onPressed: _saveSecret,
            child: const Text('Save secret'),
          ),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            onPressed: _retrieveSecret,
            child: const Text('Retrieve secret'),
          ),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            onPressed: _deleteSecret,
            child: const Text('Delete secret'),
          )
        ],
      ),
    );
  }
}
