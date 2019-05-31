import 'package:lanaedu/models/AuthenticationModel.dart';
import 'package:lanaedu/redux/modules/authentication/action.dart';
import 'package:redux/redux.dart';

Reducer<AuthenticationState> authReducer = combineReducers([
  new TypedReducer<AuthenticationState, LoginSuccess>(loginSucessReducer),
  new TypedReducer<AuthenticationState, LoginFailed>(loginFailedReducer),
  new TypedReducer<AuthenticationState, SilentLogin>(silentLoginReducer),
]);

AuthenticationState loginSucessReducer(
    AuthenticationState authState, LoginSuccess action) {
  return authState.copyWith(
      isAuthenticated: true, isAuthenticating: false, user: action.user);
}

AuthenticationState loginFailedReducer(
    AuthenticationState authState, LoginFailed action) {
  return authState.copyWith(
      isAuthenticated: false, isAuthenticating: false, user: action.user);
}

AuthenticationState silentLoginReducer(
    AuthenticationState authState, SilentLogin action) {
  return authState.copyWith(
      isAuthenticated: action.isAuthenticated, isAuthenticating: false);
}
