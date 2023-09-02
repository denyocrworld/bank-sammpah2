// ignore_for_file: avoid_print

// import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:loginandsignup/data/base/base_status_response.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';

class HomeRemoteService {
  // Dio dio = Dio();
  // Future fetchHome(AuthenticationHeaderRequest header) async {
  //   var url = BaseOptions(
  //       baseUrl:
  //           BaseConfig.BASE_DOMAIN + BaseConfig.BASE_PATH + BaseConfig.HOME_URL,
  //       headers: header.toHeader(),
  //       method: 'get');
  //   return url;
  // }

  Client client = Client();

  Future<Response> fecthHome(AuthenticationHeaderRequest header) async {
    final url = Uri.http(
        BaseConfig.BASE_DOMAIN, BaseConfig.BASE_PATH + BaseConfig.HOME_URL);

    print("URL : ${url.toString()}");

    return client.get(
      url, headers: header.toHeader(),
      // {
      //   'Content-Type': 'application/json',
      //   'Cookie': '${header.toHeader()}'
      // }
    );
  }
}
