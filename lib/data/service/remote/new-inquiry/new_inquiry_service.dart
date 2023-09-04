// ignore_for_file: avoid_print

import 'dart:collection';
import 'package:http/http.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/new-inquiry/new_inquiry_request.dart';


class NewInquiryService {
  Client client = Client();
  Future<StreamedResponse> addQuiry(
      NewInquiryRequest request, AuthenticationHeaderRequest header) async {
    final url =
        Uri.parse("http://103-175-216-13.cprapid.com:8822/server/new-inquiry");
    // final url = Uri.http(
    //   BaseConfig.BASE_DOMAIN,
    //   BaseConfig.BASE_PATH + BaseConfig.fetchQuiry,
    // );
    print("URL : ${url.toString()}");

    var multipartRequest = MultipartRequest('POST', url);
    var body = HashMap<String, String>();
    multipartRequest.files.add(
      MultipartFile.fromBytes(
        "file",
        request.image!.readAsBytesSync(),
      ),
    );
    body["service_name"] = request.service_name;
    body["weighht"] = request.weight.toString();
    body["pick_up"] = request.pick_up;
    body["pick_up_time"] = request.pick_up_time;
    multipartRequest.headers.addAll(header.toHeader());
    multipartRequest.fields.addAll(body);
    return multipartRequest.send();
  }
}
