// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/layanan/layanan_remote_response.dart';
import 'package:loginandsignup/data/service/remote/layanan/layanan_service.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/layanan/layananData.dart';
import 'package:loginandsignup/domain/repository/layanan/layanan_repository.dart';

class LayananRespositoryImpl implements LayananRepository {
  final layananService = LayananRemoteService();

  @override
  Future<ResultEntity<LayananData>> fetchLayanan(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await layananService.fetchLayanan(header);
      print("STATUS CODE :${response.statusCode} ");
      print("DATA :${response.body} ");

      if (response.statusCode == 200 || response.statusCode == 401) {
        BaseRemoteResponse<LayananResponse> baseResponseObject =
            BaseRemoteResponse<LayananResponse>.fromJson(
          jsonDecode(response.body),
          (json) => LayananResponse.fromJson(json as Map<String, dynamic>),
        );
        print(baseResponseObject.data);
        if (baseResponseObject.status == null) {
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status?.code != 1) {
          return ResultError(message: baseResponseObject.status?.message);
          // return ResultError<LayananData>(message: "Error");
        } else {
          print(baseResponseObject.data);
          return ResultSuccess(baseResponseObject.data!.toLayananData());
        }
      } else {
        print("Error Impl layanan:${response.toString()}");
        return ResultError(message: response.toString());
      }
    } catch (e) {
      print("ERROR IMPL layanan: ${e.toString()}");
      return ResultError(message: e.toString());
    }
  }
}
