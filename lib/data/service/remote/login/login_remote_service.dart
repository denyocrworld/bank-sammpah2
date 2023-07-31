import 'dart:convert';

import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/model/request/login/login_request.dart';

class LoginRemoteService {
  Client client = Client();

  Future<Response> postlogin(LoginRequest request) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.LOGIN_URL,
    );

    print("URL : ${url.toString()}");
    print('REQUEST : ${request.toJson()}');

    return client.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}

