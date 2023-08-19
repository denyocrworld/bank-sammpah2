import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';

class TukarPointRemoteService {
  Client client = Client();

  Future<Response> fecthTukarPoint(AuthenticationHeaderRequest header) async {
    final url = Uri.https(BaseConfig.BASE_DOMAIN_Mockapi,
        BaseConfig.BASE_PATH + BaseConfig.POINT_URL);
    print(url);
    return Client().get(url, headers: header.toHeader());
  }
}
