import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/model/request/login/login_request.dart';

class LoginRemoteService {
  Client client = Client();

  Future<Response> sumbitLogin(LoginRequest request) async {
    final url = Uri.https(BaseConfig.BASE_DOMAIN_Mockapi,
        BaseConfig.BASE_PATH + BaseConfig.LOGIN_URL);
    print(url);
    return client.post(url, body: request.toJson());
  }
}
