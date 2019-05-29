import 'dart:convert';

import 'package:flutter_auth0/flutter_auth0.dart';
// import 'package:lanaedu/models/AppModel.dart';
import 'package:lanaedu/models/AuthenticationModel.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:lanaedu/models/UserModel.dart';

final clientId = 'qjj6tlSJFwm7R5Ap7aUJMIx8DwjMj5dO';
final domain = 'dev-0-i4imh7.auth0.com';
final Auth0 auth = new Auth0(clientId: clientId, domain: domain);
final WebAuth web = new WebAuth(clientId: clientId, domain: domain);

class LoginSuccess {
  final User user;

  LoginSuccess(this.user);
}

ThunkAction<AuthenticationState> login = (Store store) async {
  try {
    var value = await web.authorize(
      audience: 'https://$domain/userinfo',
      scope: 'openid email offline_access',
    );
    var token = new Map<String, dynamic>.from(value);
    String accessToken = token['access_token'];
    var userInfo = await web.userInfo(token: accessToken);
    var parsedUser = new Map<String, dynamic>.from(userInfo);
    User user = new User.fromJSON(parsedUser);
    store.dispatch(LoginSuccess(user));
  } catch (error) {
    print('Error: $error');
  }
};
