import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:lanaedu/redux/modules/authentication/action.dart';
import 'package:lanaedu/screens/login/presenters/dashboardButton.dart';
import 'package:lanaedu/screens/login/presenters/header.dart';
import 'package:lanaedu/screens/login/presenters/loginButton.dart';
import 'package:lanaedu/models/AppModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final Color primaryColor = Color(0xFF4aa0d5);
  final Color backgroundColor;
  final AssetImage backgroundImage =
      new AssetImage("assets/images/landing.jpg");

  LoginScreen({Key key, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, dynamic>(
        distinct: true,
        onInit: (store) {
          SharedPreferences.getInstance().then((pref) {
            int expiredAt = pref.getInt('expiredAt');
            int now = DateTime.now().millisecondsSinceEpoch;
            if (expiredAt != null) {
              if (now > expiredAt) {
                store.dispatch(silentloginWithAuth);
              } else {
                store.dispatch((store) {
                  silentLogin(store, true);
                });
              }
            }
          });
        },
        converter: (Store<AppState> store) => () => store.dispatch(login),
        builder: (BuildContext context, loginCallback) {
          return new StoreConnector<AppState, dynamic>(
            distinct: true,
            converter: (Store<AppState> store) =>
                store.state.auth.isAuthenticated,
            builder: (BuildContext context, isAuthenticated) {
              return new Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: this.backgroundColor,
                ),
                child: new SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      LoginHeader(
                        backgroundImage: this.backgroundImage,
                        primaryColor: this.primaryColor,
                      ),
                      isAuthenticated
                          ? DashboardButton(primaryColor: this.primaryColor)
                          : LoginButton(
                              primaryColor: this.primaryColor,
                              loginCallback: loginCallback,
                            )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
