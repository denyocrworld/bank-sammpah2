import 'dart:convert';

import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/model/request/autentikasi_request/autentikasi_request.dart';

class AutentikasiRemoteService {
  Client client = Client();

  Future<Response> submitAutenikasi(Autentikasi request) async {
    final url = Uri.http(
        BaseConfig.BASE_DOMAIN, BaseConfig.BASE_PATH + BaseConfig.AUTENTIKASI);
    print('URL : ${url.toString()}');
    print('REQUEST : ${request.toJson()}');
    return Client().post(url,
        body: jsonEncode(request.toJson()),
        headers: {'Content-Type': 'application/json'});
  }
}
