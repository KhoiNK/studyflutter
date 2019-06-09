import 'dart:convert';

import 'package:flutter_auth0/flutter_auth0.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:lanaedu/models/UserModel.dart';

final clientId = 'FNBQ4bNGjxorNBcymLMhURr0ODk_e9ZS';
final domain = 'lanaed.auth0.com';
final Auth0 auth = new Auth0(clientId: clientId, domain: domain);
final WebAuth web = new WebAuth(clientId: clientId, domain: domain);

final authURL = 'https://$domain/oauth/token';

Future authenticateUser() async {
  try {
    var value = await web.authorize(
      audience: 'https://$domain/userinfo',
      scope: 'openid email offline_access',
    );
    var token = new Map<String, dynamic>.from(value);
    setSession(token);
  } catch (error) {
    print('Error: $error');
  }
}

Future<bool> silentAuth() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refreshToken');
    final response = await http.post(authURL, headers: {
      'content-type': 'application/x-www-form-urlencoded'
    }, body: {
      'grant_type': 'refresh_token',
      'client_id': clientId,
      'refresh_token': refreshToken,
    });
    await setSession(jsonDecode(response.body));
    return true;
  } catch (e) {
    return false;
  }
}

Future<User> getUserAuth0Info(String accessToken) async {
  var userInfo = await web.userInfo(token: accessToken);
  var parsedUser = new Map<String, dynamic>.from(userInfo);
  User user = new User.fromJSON(parsedUser);
  return user;
}

Future setSession(token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Future.wait([
    prefs.setString('jwt', token['access_token']),
    prefs.setInt('expiredAt',
        token['expires_in'] + DateTime.now().millisecondsSinceEpoch),
  ]);
  if (token['refresh_token'] != null) {
    await prefs.setString('refreshToken', token['refresh_token']);
  }
}
