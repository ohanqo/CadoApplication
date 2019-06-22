import 'package:cadeaux_app/utils/Constants.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      data.headers["Content-Type"] = "application/json";
      data.headers["Authorization"] = "Bearer ${prefs.getString('token')}";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    if (data.statusCode == Constants.REQUEST_UNAUTHORIZED_CODE) {
      // TODO: logout and redirect
      print('Unauthorized');
    }
    return data;
  }
}
