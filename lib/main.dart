import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:lanaedu/models/AppModel.dart';
import 'package:lanaedu/redux/store.dart';
import 'package:lanaedu/screens/homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final store = createStore();
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Login Screen 1',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
