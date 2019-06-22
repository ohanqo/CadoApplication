import 'package:cadeaux_app/services/HttpInterceptor.dart';
import 'package:http_interceptor/http_interceptor.dart';

final authHttp = HttpWithInterceptor.build(interceptors: [HttpInterceptor()]);
