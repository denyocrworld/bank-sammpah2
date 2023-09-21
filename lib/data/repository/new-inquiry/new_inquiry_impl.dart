// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:http/http.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import '../../../domain/model/request/new-inquiry/new_inquiry_request.dart';
import '../../../domain/repository/new-inquiry/new_inquiry_repository.dart';
import '../../base/result_entity.dart';
import '../../model/base_response/base_remote_response.dart';
import '../../service/remote/new-inquiry/new_inquiry_service.dart';

class NewInquiryRepositoryImpl implements NewInquiryRepository {
  final newInquiryService = NewInquiryService();

  @override
  Future<ResultEntity> addQuiry(
      NewInquiryRequest request, AuthenticationHeaderRequest header) async {
    try {
      final response = await newInquiryService.addQuiry(request, header);
      // var streamedResponse = await multipartRequest.send();
      // var response = await Response.fromStream(streamedResponse);
      print("STATUS CODE NEW QUIRY: ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse.fromJson(jsonDecode(response.body), (json) => null);

        jsonDecode(response.body);
        return ResultSuccess("");
      } else {
        print("Error Impl new-inquiry :${response.toString()}");
        return ResultError(message: response.toString());
      }
    } catch (e) {
      print("ERROR IMPL e new-inquiry: ${e.toString()}");
      return ResultError(message: e.toString());
    }
  }
}
