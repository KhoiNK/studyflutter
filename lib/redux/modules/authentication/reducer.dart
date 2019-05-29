import 'package:lanaedu/models/AuthenticationModel.dart';
import 'package:lanaedu/redux/modules/authentication/action.dart';
import 'package:redux/redux.dart';

Reducer<AuthenticationState> authReducer = combineReducers(
    [new TypedReducer<AuthenticationState, LoginSuccess>(loginSucessReducer)]);

AuthenticationState loginSucessReducer(
    AuthenticationState authState, LoginSuccess action) {
  return authState.copyWith(
      isAuthenticated: true, isAuthenticating: false, user: action.user);
}
