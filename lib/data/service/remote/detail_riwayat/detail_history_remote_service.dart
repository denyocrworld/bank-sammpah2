import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';

class DetailHistoryRemoteService {
  Client client = Client();
  Future<Response> fecthDetailHistory(
      AuthenticationHeaderRequest header) async {
    final url = Uri.https(BaseConfig.BASE_DOMAIN_Mockapi,
        BaseConfig.BASE_PATH + BaseConfig.DETAIL_HISTORY);
    print(url);
    return client.get(
      url,
    );
  }
}
