// ignore_for_file: avoid_print

import 'dart:convert';

// import 'package:http/http.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/request/profile/profileRequest.dart';
import '../../../domain/repository/changeProfile/change_profile_repository.dart';
import '../../base/result_entity.dart';
import '../../model/base_response/base_remote_response.dart';
import '../../service/remote/cange_profile/change_profile_service.dart';

class ChangeProfileRepositoryImpl implements ChangeProfileRepository {
  final changeProfileService = ChangeProfileRemoteService();

  @override
  Future<ResultEntity> fetchChangeProfile(
      ProfileRequest request, AuthenticationHeaderRequest header) async {
    try {
      // final streamResponse =
      //     await changeProfileService.fetchChangeProfile(request, header);
      // var response = await Response.fromStream(streamResponse);
      final response =
          await changeProfileService.fetchChangeProfile(request, header);
      print("STATUS CODE: ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse.fromJson(jsonDecode(response.body), (json) => null);

        jsonDecode(response.body);
        return ResultSuccess("");
      } else {
        print("Error Impl change profile :${response.toString()}");
        return ResultError(message: response.toString());
      }
    } catch (e) {
      print("ERROR IMPL change profile: ${e.toString()}");
      return ResultError(message: e.toString());
    }
  }
}
