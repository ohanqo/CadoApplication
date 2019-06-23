import 'package:cadeaux_app/dtos/AddCadeauDto.dart';
import 'package:cadeaux_app/services/AuthService.dart';
import 'package:cadeaux_app/utils/Constants.dart';
import 'package:http/http.dart' as http;

class GiftRepository {
  GiftRepository._privateConstructor();

  static final GiftRepository _instance = GiftRepository._privateConstructor();

  static GiftRepository get instance {
    return _instance;
  }

  Future<http.Response> addGiftToCurrentUser(AddCadeauDto cadeauDto) async {
    return await authHttp.post("${Constants.API_BASE_URL}/gift",
        body: cadeauDto.toJson());
  }

  Future<http.Response> getGifts() async {
    return await authHttp.get("${Constants.API_BASE_URL}/gifts");
  }

  Future<http.Response> deleteGift(int id) async {
    return await authHttp.delete("${Constants.API_BASE_URL}/gift/$id");
  }
}
