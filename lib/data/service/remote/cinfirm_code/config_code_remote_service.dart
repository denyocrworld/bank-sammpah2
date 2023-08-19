// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures

import 'dart:convert';

import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/model/request/confirm_code_request/confirm_code.dart';

class ConfigCodeRemoteService {
  Client client = Client();

  Future<Response> submitConfigCode(ConfirmCodeRequest request) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.CONFIG_KODE,
    );

    print("URL : ${url.toString()}");
    print('REQUEST : ${request.toJson()}');
    var email = await Commons().getEmail();
    var token = await Commons().getEmail();
    return Client().post(url, body: jsonEncode(request.toJson()), headers: {
      'Content-Type': 'application/json ',
      'Cookie': 'email=$email;token=$token'
    });
  }
}
