import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';

class LogoutRemoteService {
  Client client = Client();

  Future<Response> submitLogout(AuthenticationHeaderRequest header) async {
    final url = Uri.http(
        BaseConfig.BASE_DOMAIN, BaseConfig.BASE_PATH + BaseConfig.fetchLogout);
    print('URL : ${url.toString()}');

    return client.get(
      url,
      headers: header.toHeader(),
    );
  }
}
