import 'package:cadeaux_app/dto/CreateUserDto.dart';
import 'package:cadeaux_app/utils/Constants.dart';
import 'package:http/http.dart' as http;

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
}
