import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/service/remote/logout/logout_service.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/repository/logout/logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final logoutService = LogoutRemoteService();

  @override
  Future<ResultEntity> logout(AuthenticationHeaderRequest header) async {
    // TODO: implement logout
    try {
      final response = await logoutService.submitLogout(header);
      print('STATUS CODE ${response.statusCode}');
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 400) {
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
