import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:lanaedu/models/AuthenticationModel.dart';
import 'package:lanaedu/utils/authClients.dart';

class LoginResult {
  final bool isAuthenticated;

  LoginResult(this.isAuthenticated);
}

ThunkAction<AuthenticationState> login = (Store store) async {
  try {
    await authenticateUser();
    store.dispatch(LoginResult(true));
  } catch (error) {
    print('Error: $error');
    store.dispatch(LoginResult(false));
  }
};

Function silentloginWithAuth = (Store store) async {
  final result = await silentAuth();
  store.dispatch(LoginResult(result));
};

Function silentLogin = (Store store, isAuthenticated) {
  store.dispatch(LoginResult(isAuthenticated));
};