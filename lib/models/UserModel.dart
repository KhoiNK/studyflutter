class User {
  String name;
  String givenName;
  String familyName;
  String middleName;
  String nickname;
  String preferredUsername;
  String profile;
  String picture;
  String email;
  bool emailVerified;
  String gender;
  String birthdate;
  String phoneNumber;

  User(
      {this.name,
      this.birthdate,
      this.email,
      this.emailVerified,
      this.familyName,
      this.gender,
      this.givenName,
      this.middleName,
      this.nickname,
      this.picture,
      this.preferredUsername,
      this.profile,
      this.phoneNumber});

  factory User.fromJSON(Map<String, dynamic> parsedJson) {
    return User(
        birthdate: parsedJson['birthdate'],
        email: parsedJson['email'],
        emailVerified: parsedJson['email_verified'],
        familyName: parsedJson['family_name'],
        gender: parsedJson['gender'],
        givenName: parsedJson['given_name'],
        middleName: parsedJson['middle_name'],
        name: parsedJson['name'],
        nickname: parsedJson['nickname'],
        picture: parsedJson['picture'],
        preferredUsername: parsedJson['preferred_username'],
        profile: parsedJson['profile'],
        phoneNumber: parsedJson['phone_number']);
  }
}

class UserState {
  final User user;

  UserState({this.user});

  UserState copyWith({User user}) {
    return new UserState(
      user: user ?? this.user,
    );
  }

  factory UserState.fromJSON(Map<String, dynamic> parsedJson) {
    return UserState(
        user: parsedJson['user'] == null
            ? null
            : new User.fromJSON(parsedJson['user']));
  }
}
