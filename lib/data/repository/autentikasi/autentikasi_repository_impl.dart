import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/service/remote/autentikasi/autentikasi_remote_service.dart';
import 'package:loginandsignup/domain/model/request/autentikasi_request/autentikasi_request.dart';
import 'package:loginandsignup/domain/repository/autentikasi/autentikasi_repository.dart';

class AutentikasiRepositoryImpl implements AutentikasiRepository {
  final autentikasiRemoteService = AutentikasiRemoteService();

  @override
  Future<ResultEntity> autentikasi(Autentikasi request) async {
    
    try {
      final response = await autentikasiRemoteService.submitAutenikasi(request);
      print("STATUS CODE : ${response.statusCode}");
      print(response.body);
      if (response.statusCode == 201) {
        BaseRemoteResponse baseResponseObject = BaseRemoteResponse.fromJson(
            jsonDecode(response.body), (json) => null);
      jsonDecode(response.body);
      print(baseResponseObject.data);
      if (baseResponseObject.status == null) {
        return ResultError(message: baseResponseObject.status!.message);
      }else if (baseResponseObject.status!.code != 1) {
        return ResultError(message: baseResponseObject.status!.message);
      }else {
        return ResultSuccess(baseResponseObject.data);
      }
      }else {
        return ResultError(message: response.body);
      }
    } catch (e) {
      return ResultError(message: " ");
    }
  }
}
