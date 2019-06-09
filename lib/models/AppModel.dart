import 'package:lanaedu/models/AuthenticationModel.dart';
import 'package:lanaedu/models/UserModel.dart';

class AppState {
  AuthenticationState auth;
  UserState user;

  AppState({this.auth, this.user}) {
    auth = auth ?? new AuthenticationState();
    user = user ?? new UserState();
  }

  static AppState toJSON(dynamic parsedJson) => new AppState(
    auth: new AuthenticationState.fromJSON(parsedJson['auth']),
    user: new UserState.fromJSON(parsedJson['user'])
  );
}