import 'package:cadeaux_app/dto/CreateUserDto.dart';
import 'package:cadeaux_app/utils/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:cadeaux_app/dto/LoginUserDto.dart';

class UserRepository {
  UserRepository._privateConstructor();

  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance {
    return _instance;
  }

  Future<http.Response> register(CreateUserDto createDto) async {
    return await http.post("${Constants.API_BASE_URL}/register",
        body: createDto.toJson());
  }

  Future<http.Response> login(LoginUserDto loginDto) async {
    return await http.post("${Constants.API_BASE_URL}/login",
        body:loginDto.toJson());
  }
}
