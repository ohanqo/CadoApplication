import 'dart:convert';

class LoginUserDto {
  final String username;
  final String password;

  LoginUserDto({this.username, this.password});

  Object toJson() {
    return json.encode({
      "username": username,
      "password": password
    });
  }
}
