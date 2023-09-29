// ignore_for_file: avoid_print, unused_import

import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/profile/profileRequest.dart';
import '../../../base/base_status_response.dart';
import 'dart:convert';

class ChangeProfileRemoteService {
  Client client = Client();

  Future<Response> fetchChangeProfile(
      ProfileRequest request, AuthenticationHeaderRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchChangeProfile,
    );
    if (request.image != null) {
      print('tidak null');
    } else {
      print('null');
    }
    print("URL : ${url.toString()}");
    var multipartRequest = MultipartRequest('POST', url);

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

    // if (request.image != null) {
    //   multipartRequest.files.add(
    //     await MultipartFile.fromPath(
    //       "file",
    //       request.image!.path,
    //     ),
    //   );
    // }

    // multipartRequest.files.add(
    //   MultipartFile.fromBytes(
    //     "jpg",
    //     request.image!.readAsBytesSync(),
    //   ),
    // );
    // var imageFile = MultipartFile.fromBytes(
    //   'jpg',
    //   request.image!.readAsBytesSync(),
    // );
    // multipartRequest.files.add(imageFile);
    body["name"] = request.name;
    body["address"] = request.address;
    body["phone_number"] = request.phone_number;
    body["email"] = request.email;
    //begini succes image tidak ke send
    // if (request.image != null) {
    //   multipartRequest.files.add(MultipartFile.fromString(
    //       "jpg",
    //       request.image!
    //           .readAsStringSync(encoding: jsonDecode(jsonEncode(request))),
    //       filename: request.image!.path.split("/").last));
    // }
    //begini error forbidden extension file
    // /

    // multipartRequest.files.add(MultipartFile(
    //     'jpg',
    //     File(request.image!.path).readAsBytes().asStream(),
    //     File(request.image!.path).lengthSync(),
    //     filename: request.image!.path.split("/").last));

    var token = header.accesToken;
    print("ini header change profile : $token");
    multipartRequest.headers.addAll({
      'Authorization': 'Bearer $token',
      'Cookie': 'token=$token',
      'Set-Cookie': 'token=$token',
      'Content-Type': 'application/json'
    });

    multipartRequest.fields.addAll(body);
    // multipartRequest.headers.addAll(header.toHeader());
    var streamedResponse = await multipartRequest.send();
    var response = await Response.fromStream(streamedResponse);

    return response;
  }
}

// class ChangeProfileService {
//   Client client = Client();
//   Future<StreamedResponse> fetchChangeProfile(
//       ProfileRequest request, AuthenticationHeaderRequest header) async {
//     final url = Uri.http(
//       BaseConfig.BASE_DOMAIN,
//       BaseConfig.BASE_PATH + BaseConfig.fetchChangeProfile,
//     );
//     print("URL : ${url.toString()}");

//     var multipartRequest = MultipartRequest('POST', url);

//     var body = HashMap<String, String>();
//     // if (request.image != null) {
//     //   multipartRequest.files.add(
//     //     await MultipartFile.fromPath(
//     //       "file",
//     //       request.image!.path,
//     //     ),
//     //   );
//     // }

//     // multipartRequest.files.add(
//     //   MultipartFile.fromString(
//     //     "file",
//     //     request.image!.path,
//     //   ),
//     // );
//     var imageFile = await MultipartFile.fromPath(
//       'file',
//       request.image!.path,
//     );
//     multipartRequest.files.add(imageFile);
//     body["name"] = request.name;
//     body["address"] = request.address;
//     body["phone_number"] = request.phone_number;
//     body["email"] = request.email;
//     multipartRequest.headers.addAll(header.toHeader());
//     multipartRequest.fields.addAll(body);
//     return multipartRequest.send();
//   }

//   // var streamedResponse = await multipartRequest.send();
//   // var response = await Response.fromStream(streamedResponse);
// }
