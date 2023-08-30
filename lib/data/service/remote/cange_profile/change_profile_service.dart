import 'dart:convert';
import 'package:http/http.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/profile/profileRequest.dart';
import '../../../base/base_status_response.dart';

class ChangeProfileService {
  Client client = Client();
  Future<Response> fetchChangeProfile(
      ProfileRequest request, AuthenticationHeaderRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchChangeProfile,
    );
    print("URL : ${url.toString()}");
    return client.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    // var multipartRequest = MultipartRequest('POST', url);

    // var imageFile = await MultipartFile.fromPath('file', "");

    // multipartRequest.files.add(imageFile);

    // multipartRequest.headers.addAll(header.toHeader());

    // var streamedResponse = await multipartRequest.send();
    // var response = await Response.fromStream(streamedResponse);

    // return response;
  }
}
