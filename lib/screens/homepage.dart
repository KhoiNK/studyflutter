import 'package:flutter/material.dart';
import 'package:lanaedu/screens/login/index.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: LoginScreen(
            backgroundColor: Colors.white,
            backgroundImage: new AssetImage("assets/images/landing.jpg"),
          ),
        ));
  }
}
