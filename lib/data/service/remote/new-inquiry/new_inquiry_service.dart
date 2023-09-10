// ignore_for_file: avoid_print

import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/new-inquiry/new_inquiry_request.dart';
import '../../../base/base_status_response.dart';

class NewInquiryService {
  Client client = Client();
  Future<StreamedResponse> addQuiry(
      NewInquiryRequest request, AuthenticationHeaderRequest header) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchQuiry,
    );

    var multipartRequest = http.MultipartRequest('POST', url);
    print("URL new-inquiry : ${url.toString()}");

    // var multipartRequest = MultipartRequest('POST', url);
    var body = HashMap<String, String>();
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
    multipartRequest.headers.addAll(header.toHeader());
    multipartRequest.fields.addAll(body);
    multipartRequest.files.add(http.MultipartFile(
      'file',
      request.image!.readAsBytes().asStream(),
      request.image!.lengthSync(),
    ));
    return multipartRequest.send();
  }
}
