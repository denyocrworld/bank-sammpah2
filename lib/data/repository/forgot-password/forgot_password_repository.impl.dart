import 'dart:convert';
import 'dart:developer';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/service/remote/forgot-password/forgot_pass_remote_service.dart';
import 'package:loginandsignup/domain/model/request/forgot_request/forgot_password.dart';

import 'package:loginandsignup/domain/repository/forgot-password/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final forgotPasswordService = ForgotPasswordRemoteService();

  @override
  Future<ResultEntity> forgotPassword(ForgotPassword request) async {
    // TODO: implement submitForgotPassword
    try {
      final response = await forgotPasswordService.submitForgotPassword(request);
      print("STATUS CODE: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse baseResponseObject = BaseRemoteResponse.fromJson(
            jsonDecode(response.body), (json) => null);

            jsonDecode(response.body);
        if (baseResponseObject.status == null) {
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status!.code != 0) {
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
