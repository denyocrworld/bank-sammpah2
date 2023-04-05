import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/service/remote/confirmation-code/config_code_remote_service.dart';
import 'package:loginandsignup/domain/repository/config-code/config_code_repository.dart';

class ConfigCodeRepositoryImpl implements ConfigCodeRepository {
  final configCodeService = ConfigCodeRemoteService();

  @override
  Future<ResultEntity> submitConfigCode(String kode) async {
    // TODO: implement submitConfigCode
    try {
      final response = await configCodeService.submitConfigCode(kode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse baseResponseObject = BaseRemoteResponse.fromJson(
            jsonDecode(response.body), (json) => null);
        if (baseResponseObject.status == null) {
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status!.code != 0) {
          return ResultError(message: baseResponseObject.status!.message);
        } else {
          return ResultSuccess(baseResponseObject.data);
        }
      } else {
        return ResultError(message: "");
      }
    } catch (e) {
      return ResultError(message: e.toString());
    }
  }
}
