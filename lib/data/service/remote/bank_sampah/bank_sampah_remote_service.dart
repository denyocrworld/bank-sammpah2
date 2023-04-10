import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';

class BankSampahRemoteService {
  Client client = Client();

  Future<Response> fetchBankSampah(AuthenticationHeaderRequest header) async {
    final url = Uri.https(BaseConfig.BASE_DOMAIN_Mockapi,
        BaseConfig.BASE_PATH + BaseConfig.BANK_SAMPAH);
    print(url);
    return Client().get(url, headers: header.toHeader());
  }
}
