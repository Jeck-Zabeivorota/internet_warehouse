import 'package:flutter/material.dart';
import 'package:win_app/Authorization/Login.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internet warehouse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authorization(),
    );
  }

  Login authorization() {
    var f = File("lib\\log.txt");
    if (!f.existsSync()) return Login();
    final log = f.readAsLinesSync();
    return Login(email: log[0], pass: log[1]);
  }
}
