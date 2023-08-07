import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/registrasi/registrasi_response.dart';
import 'package:loginandsignup/data/service/remote/registrasi/registrasi_remote_service.dart';
import 'package:loginandsignup/domain/model/data/registrasi/registrasi__data.dart';
import 'package:loginandsignup/domain/model/request/Register/register_request.dart';
import 'package:loginandsignup/domain/repository/registrasi/registrasi_repository.dart';

class RegistrasiRepositoryImpl implements RegistrasiRepository {
  final registrasiRemoteService = RegistrasiRemoteService();

  @override
  Future<ResultEntity<RegisterData>> submitRegister(
      RegisterRequest request) async {
    // TODO: implement submitRegister
    try {
      final response = await registrasiRemoteService.postRegister(request);
      print("STATUS CODE: ${response.statusCode}");
      print(response.body);

      if (response.statusCode == 201) {
        BaseRemoteResponse<RegisterResponse> baseResponseeObject =
            BaseRemoteResponse<RegisterResponse>.fromJson(
          jsonDecode(response.body),
          (json) => RegisterResponse.fromJson(json as Map<String, dynamic>),
        );

        RegisterResponse.fromJson(
          jsonDecode(response.body),
        );
        print(baseResponseeObject.data);
        if (baseResponseeObject.status == null) {
          return ResultError();
        } else if (baseResponseeObject.status?.code != 1) {
          return ResultError(message: baseResponseeObject.status?.message);
        } else if (baseResponseeObject.data == null) {
          return ResultError(message: baseResponseeObject.status?.message);
        } else {
          return ResultSuccess(baseResponseeObject.data!.toRegisterData());
        }
      } else {
        return ResultError(message: response.body);
      }
    } catch (e) {
      return ResultError(message: '');
    }
  }
}
