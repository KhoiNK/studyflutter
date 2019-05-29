import 'package:flutter/material.dart';
import 'package:lanaedu/screens/login/presenters/header.dart';
import 'package:lanaedu/screens/login/presenters/loginButton.dart';
import 'package:flutter_auth0/flutter_auth0.dart';

final clientId = 'qjj6tlSJFwm7R5Ap7aUJMIx8DwjMj5dO';
final domain = 'dev-0-i4imh7.auth0.com';
final Auth0 auth = new Auth0(clientId: clientId, domain: domain);
final WebAuth web = new WebAuth(clientId: clientId, domain: domain);

class LoginScreen extends StatelessWidget {
  final Color primaryColor = Color(0xFF4aa0d5);
  final Color backgroundColor;
  final AssetImage backgroundImage;

  LoginScreen({Key key, this.backgroundColor, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: this.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          LoginHeader(
              backgroundImage: this.backgroundImage,
              primaryColor: this.primaryColor),
          LoginButton(
            primaryColor: this.primaryColor
          )
        ],
      ),
    );
  }
}
