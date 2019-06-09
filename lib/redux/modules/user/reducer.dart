import 'package:redux/redux.dart';

import 'package:lanaedu/models/UserModel.dart';
import 'package:lanaedu/redux/modules/user/action.dart';

Reducer<UserState> userReducer = combineReducers([
  new TypedReducer<UserState, GetUserInfoAction>(getUserInfoReducer),
]);

UserState getUserInfoReducer(
    UserState userState, GetUserInfoAction action) {
  return userState.copyWith(
      user: action.user);
}
