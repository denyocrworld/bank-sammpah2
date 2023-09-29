// ignore_for_file: avoid_print

import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/new-inquiry/new_inquiry_request.dart';
import '../../../base/base_status_response.dart';

class NewInquiryService {
  Client client = Client();
  Future<Response> addQuiry(
      NewInquiryRequest request, AuthenticationHeaderRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchQuiry,
    );

    var multipartRequest = http.MultipartRequest('POST', url);
    print("URL new-inquiry : ${url.toString()}");

    // var multipartRequest = MultipartRequest('POST', url);
    var body = HashMap<String, String>();
    if (request.image != null) {
      var imageFile = request.image!;
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
        'file',
        stream,
        length,
        filename: imageFile.path.split("/").last,
        contentType: MediaType('image', 'jpeg'),
        // Sesuaikan tipe konten dengan jenis gambar yang dikirimkan
      );

      multipartRequest.files.add(multipartFile);
    }
    // multipartRequest.files.add(
    //   await MultipartFile.fromPath(
    //     "file",
    //     request.image!.path,
    //   ),
    // );
    // if (request.image != null) {
    //   multipartRequest.files.add(
    //     MultipartFile.fromBytes(
    //       "file",
    //       request.image!.readAsBytesSync(),
    //     ),
    //   );
    // }
    body["service_name"] = request.service_name;
    body["weighht"] = request.weight.toString();
    body["pick_up"] = request.pick_up;
    body["pick_up_time"] = request.pick_up_time;

    var token = header.accesToken;
    print("ini header layanan screen : $token");
    multipartRequest.headers.addAll({
      'Authorization': 'Bearer $token',
      'Cookie': 'token=$token',
      'Set-Cookie': 'token=$token',
      'Content-Type': 'application/json'
    });
    multipartRequest.fields.addAll(body);

    var streamedResponse = await multipartRequest.send();
    var response = await Response.fromStream(streamedResponse);
    return response;
  }
}
