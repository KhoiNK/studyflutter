import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> apiGet(String url, [Map<String, String> header]) async {
  var apiHeader = {};
  if (header != null) {
    apiHeader = header;
  } else {
    apiHeader = await getHeader();
  }
  var response = await http.get(url, headers: apiHeader);
  return jsonDecode(response.body);
}

Future<Map<String, String>> getHeader() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('accessToken');
  return {'content-type': 'application/json', 'authorization': 'Bearer $token'};
}
