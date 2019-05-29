import 'package:lanaedu/models/AuthenticationModel.dart';

class AppState {
  AuthenticationState auth;

  AppState({this.auth}) {
    auth = auth ?? new AuthenticationState();
  }

  static AppState toJSON(dynamic parsedJson) => new AppState(
    auth: new AuthenticationState.fromJSON(parsedJson['auth'])
  );
}