import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';

class ForgotPasswordRemoteService {
  Client client = Client();

  Future<Response> submitForgotPassword(String email) async {
    final url = Uri.https(BaseConfig.BASE_DOMAIN_Mockapi,
        BaseConfig.BASE_PATH + BaseConfig.FORGOT_PASSWORD);
    print(url);
    return Client().post(url, body: {"email": email});
  }
}
