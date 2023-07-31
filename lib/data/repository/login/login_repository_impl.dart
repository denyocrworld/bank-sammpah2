import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/login/login_response.dart';
import 'package:loginandsignup/data/service/remote/login/login_remote_service.dart';
import 'package:loginandsignup/domain/model/data/login/login_data.dart';
import 'package:loginandsignup/domain/model/request/login/login_request.dart';
import 'package:loginandsignup/domain/repository/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final loginRemoteService = LoginRemoteService();

  @override
  Future<ResultEntity<LoginData>> submitLogin(LoginRequest request) async {
    // TODO: implement loginUser
    try {
      final response = await loginRemoteService.postlogin(request);

      print("STATUS CODE: ${response.statusCode}");
      print(response.body);

      if (response.statusCode == 200) {
        BaseRemoteResponse<LoginResponse> baseResponseObject =
            BaseRemoteResponse<LoginResponse>.fromJson(
          jsonDecode(response.body),
          (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
        );

        LoginResponse.fromJson(
          jsonDecode(response.body),
        );
        print(baseResponseObject.data);
        if (baseResponseObject.status == null) {
          return ResultError();
        } else if (baseResponseObject.status?.code != 1) {
          return ResultError(message: baseResponseObject.status?.message);
        } else if (baseResponseObject.data == null) {
          return ResultError(message: baseResponseObject.status?.message);
        } else {
          return ResultSuccess(baseResponseObject.data!.toLoginData());
        }
      } else {
        return ResultError(message: response.body);
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
