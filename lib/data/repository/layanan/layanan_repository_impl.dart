// ignore_for_file: avoid_print

import 'dart:convert';
import '../../../domain/base/authentication_header_request.dart';
import '../../../domain/model/data/layanan/layananData.dart';
import '../../../domain/repository/layanan/layanan_repository.dart';
import '../../base/result_entity.dart';
import '../../model/base_response/base_remote_response.dart';
import '../../model/layanan/layanan_remote_response.dart';
import '../../service/remote/layanan/layanan_service.dart';

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

        // ignore: avoid_print
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
        return ResultError(message: "Terjadi kesalahan saat mengambil data");
      }
    } catch (e) {
      print("ERROR IMPL: ${e.toString()}");
      return ResultError(
          message: 'Terjadi kesalahan saat mengambil data. Silakan coba lagi.');
    }
  }
}
