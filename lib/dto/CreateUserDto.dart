import 'dart:convert';

class CreateUserDto {
  final String username;
  final String lastName;
  final String firstName;
  final String password;

  CreateUserDto({this.username, this.lastName, this.firstName, this.password});

  Object toJson() {
    return json.encode({
      "username": username,
      "lastName": lastName,
      "firstName": firstName,
      "password": password
    });
  }
}
