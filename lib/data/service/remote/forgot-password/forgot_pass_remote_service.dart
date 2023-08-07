import 'dart:convert';
import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/model/request/forgot_request/forgot_password.dart';

class ForgotPasswordRemoteService {
  Client client = Client();

  Future<Response> submitForgotPassword(ForgotPassword request) async {
    final url = Uri.http(BaseConfig.BASE_DOMAIN,
        BaseConfig.BASE_PATH + BaseConfig.FORGOT_PASSWORD);
    print("URL : ${url.toString()}");
    print('REQUEST : ${request.toJson()}');
    return Client().post(url,
        body: jsonEncode(request.toJson()),
        headers: {'Content-Type': 'application/json'});
  }
}
