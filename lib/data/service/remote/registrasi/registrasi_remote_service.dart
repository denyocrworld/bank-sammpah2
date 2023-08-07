import 'dart:convert';

import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/model/request/Register/register_request.dart';

class RegistrasiRemoteService {
  Client client = Client();

  Future<Response> postRegister(RegisterRequest request) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.REGISTER_URL,
    );
    print("URL : ${url.toString()}");
    print('REQUEST : ${request.toString()}');

    return client.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
