// ignore_for_file: avoid_print

import 'dart:collection';
import 'package:http/http.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/profile/profileRequest.dart';
import '../../../base/base_status_response.dart';

class ChangeProfileService {
  Client client = Client();
  Future<StreamedResponse> fetchChangeProfile(
      ProfileRequest request, AuthenticationHeaderRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchChangeProfile,
    );
    print("URL : ${url.toString()}");

    var multipartRequest = MultipartRequest('POST', url);

    var body = HashMap<String, String>();
    // if (request.image != null) {
    //   multipartRequest.files.add(
    //     await MultipartFile.fromPath(
    //       "file",
    //       request.image!.path,
    //     ),
    //   );
    // }

    // multipartRequest.files.add(
    //   MultipartFile.fromString(
    //     "file",
    //     request.image!.path,
    //   ),
    // );
    var imageFile = await MultipartFile.fromPath(
      'file',
      request.image!.path,
    );
    multipartRequest.files.add(imageFile);
    body["name"] = request.name;
    body["address"] = request.address;
    body["phone_number"] = request.phone_number;
    body["email"] = request.email;
    multipartRequest.headers.addAll(header.toHeader());
    multipartRequest.fields.addAll(body);
    return multipartRequest.send();
  }

  // var streamedResponse = await multipartRequest.send();
  // var response = await Response.fromStream(streamedResponse);
}
