import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';

class ConfigCodeRemoteService {
  Client client = Client();
  Future<Response> submitConfigCode(String kode) async {
    final url = Uri.https(BaseConfig.BASE_DOMAIN_Mockapi,
        BaseConfig.BASE_PATH + BaseConfig.CONFIG_KODE);
    print(url);
    return Client().post(url, body: {"masuka kode": kode});
  }
}
