// ignore_for_file: prefer_const_constructors
import 'package:digital_dental/themain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'signup.dart';
import 'login.dart';
import 'themain.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: themain(),
    );
  }

}
