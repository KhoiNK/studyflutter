import 'package:lanaedu/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';

import 'package:lanaedu/utils/authClients.dart';

class GetUserInfoAction {
  User user;
  GetUserInfoAction(this.user);
}

Function getUserInfo = (Store store) async {
  try {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String accessToken = prefs.getString('accessToken');
  User user = await getUserAuth0Info(accessToken);
  store.dispatch(GetUserInfoAction(user));
  } catch(e) {
    print('Error: $e');
    store.dispatch(GetUserInfoAction(null));
  }
};