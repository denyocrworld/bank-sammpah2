// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/request/profile/profileRequest.dart';

import '../../../domain/repository/changeProfile/change_profile_repository.dart';
import '../../base/result_entity.dart';
import '../../model/base_response/base_remote_response.dart';
import '../../service/remote/cange_profile/change_profile_service.dart';

class ChangeProfileRepositoryImpl implements ChangeProfileRepository {
  final changeProfileService = ChangeProfileService();

  @override
  Future<ResultEntity> fetchChangeProfile(ProfileRequest request,
      AuthenticationHeaderRequest header, File image) async {
    try {
      final response =
          await changeProfileService.fetchChangeProfile(request, header, image);
      print("STATUS CODE: ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse baseResponseObject = BaseRemoteResponse.fromJson(
            jsonDecode(response.body), (json) => null);

        jsonDecode(response.body);
        print(baseResponseObject.data);
        if (baseResponseObject.status == null) {
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status!.code != 1) {
          return ResultError(message: baseResponseObject.status!.message);
        } else {
          return ResultSuccess(baseResponseObject.data);
        }
      } else {
        return ResultError(message: response.body);
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
