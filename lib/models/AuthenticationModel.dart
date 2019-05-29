import 'package:lanaedu/models/UserModel.dart';

class Authentication {
  final String accessToken;
  final String refreshToken;
  final String idToken;
  final String tokenType;
  final int expiresIn;

  Authentication(
      {this.accessToken,
      this.expiresIn,
      this.idToken,
      this.refreshToken,
      this.tokenType});

  factory Authentication.fromJSON(Map<String, dynamic> parsedJson) {
    return Authentication(
        accessToken: parsedJson['access_token'],
        expiresIn: parsedJson['expires_in'],
        idToken: parsedJson['id_token'],
        refreshToken: parsedJson['refresh_token'],
        tokenType: parsedJson['token_type']);
  }
}

class AuthenticationState {
  final bool isAuthenticating;
  final bool isAuthenticated;
  final User user;

  AuthenticationState(
      {this.isAuthenticated = false, this.isAuthenticating = false, this.user});

  AuthenticationState copyWith(
      {bool isAuthenticated, bool isAuthenticating, String error, User user}) {
    return new AuthenticationState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      user: user ?? this.user,
    );
  }

  factory AuthenticationState.fromJSON(Map<String, dynamic> parsedJson) {
    return AuthenticationState(
      isAuthenticated: parsedJson['isAuthenticated'],
      isAuthenticating: parsedJson['isAuthenticating'],
      user: parsedJson['user'] == null ? null : new User.fromJSON(parsedJson['user'])
    );
  }
}
