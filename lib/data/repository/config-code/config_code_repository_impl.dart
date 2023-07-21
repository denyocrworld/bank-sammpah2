import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/service/remote/cinfirm_code/config_code_remote_service.dart';
import 'package:loginandsignup/domain/model/request/confirm_code_request/confirm_code.dart';
import 'package:loginandsignup/domain/repository/confrim_code/config_code_repository.dart';

class ConfigCodeRepositoryImpl implements ConfigCodeRepository {
  final configCodeService = ConfigCodeRemoteService();

  @override
  Future<ResultEntity> submitConfirmCode(ConfirmCodeRequest request) async {
    // TODO: implement submitConfigCode
    try {
      final response = await configCodeService.submitConfigCode(request);
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
