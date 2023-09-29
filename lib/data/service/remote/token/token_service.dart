// ignore_for_file: avoid_print

import 'package:http/http.dart';

import '../../../../domain/base/authentication_header_request.dart';
import '../../../base/base_status_response.dart';

class TokenRemoteService {
  Client client = Client();

  Future<Response> fetchRefreshToken(AuthenticationHeaderRequest header) async {
    final url = Uri.http(
        BaseConfig.BASE_DOMAIN, BaseConfig.BASE_PATH + BaseConfig.fetchToken);

    print("URL : ${url.toString()}");

    print("ini header token : ${header.toHeader()}");

    return client.get(url, headers: header.toHeader());
  }
}
