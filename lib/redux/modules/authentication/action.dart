import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:lanaedu/models/AuthenticationModel.dart';
import 'package:lanaedu/utils/authClients.dart';
import 'package:lanaedu/models/UserModel.dart';

class LoginSuccess {
  final User user;

  LoginSuccess(this.user);
}

class SilentLogin {
  final bool isAuthenticated;

  SilentLogin(this.isAuthenticated);
}

class LoginFailed {
  final User user;

  LoginFailed(this.user);
}

ThunkAction<AuthenticationState> login = (Store store) async {
  try {
    User user = await authenticateUser();
    if (user == null) {
      store.dispatch(LoginFailed(null));
    } else {
      store.dispatch(LoginSuccess(user));
    }
  } catch (error) {
    print('Error: $error');
  }
};

Function silentloginWithAuth = (Store store) async {
  final result = await silentAuth();
  if (result == true) {
    store.dispatch(SilentLogin(true));
  } else {
    store.dispatch(SilentLogin(false));
  }
};

Function silentLogin = (Store store, isAuthenticated) {
  store.dispatch(SilentLogin(isAuthenticated));
};