import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:lanaedu/models/AppModel.dart';
import 'package:lanaedu/redux/store.dart';
import 'package:lanaedu/screens/homepage.dart';
import 'package:lanaedu/screens/login/index.dart';
import 'package:lanaedu/screens/user/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final store = createStore();
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Lana Edu',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder> {
          '/': (BuildContext context) => new MyHomePage(),
          '/profile': (BuildContext context) => new StoreConnector<AppState, dynamic>(
            converter: (store) => store.state.auth.isAuthenticated,
            builder: (BuildContext context, isAuthenticated) => isAuthenticated ? new UserScreen() : new LoginScreen()
          ),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
