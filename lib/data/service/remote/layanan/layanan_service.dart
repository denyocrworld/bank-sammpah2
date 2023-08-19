import 'package:http/http.dart';
import '../../../../domain/base/authentication_header_request.dart';
import '../../../base/base_status_response.dart';

class LayananRemoteService {
  Client client = Client();

  Future<Response> fetchLayanan(AuthenticationHeaderRequest header) async {
    final url = Uri.http(
        BaseConfig.BASE_DOMAIN, BaseConfig.BASE_PATH + BaseConfig.fetchLayanan);

    print("URL : ${url.toString()}");

    return client.get(url, headers: header.toHeader());
  }
}
