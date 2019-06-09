import 'package:lanaedu/models/AuthenticationModel.dart';
import 'package:lanaedu/redux/modules/authentication/action.dart';
import 'package:redux/redux.dart';

Reducer<AuthenticationState> authReducer = combineReducers([
  new TypedReducer<AuthenticationState, LoginResult>(silentLoginReducer),
]);

AuthenticationState silentLoginReducer(
    AuthenticationState authState, LoginResult action) {
  return authState.copyWith(
      isAuthenticated: action.isAuthenticated, isAuthenticating: false);
}
