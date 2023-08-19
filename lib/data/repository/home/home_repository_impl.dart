import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/home/home_remote_response.dart';
import 'package:loginandsignup/data/service/remote/home/home_remote_service.dart';
import 'package:loginandsignup/domain/model/data/home/home_data.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/repository/home/home.repository.dart';

class HomeRespositoryImpl implements HomeRepository {
  final homeService = HomeRemoteService();

  @override
  Future<ResultEntity<HomeData>> fecthHome(
      AuthenticationHeaderRequest header) async {
    // TODO: implement fecthHome
    try {
      final response = await homeService.fecthHome(header);
      print("STATUS CODE :${response.statusCode} ");
      print("DATA :${response.body} ");

      if (response.statusCode == 200 || response.statusCode == 401) {
        BaseRemoteResponse<HomeRemoteResponse> baseResponseObject =
            BaseRemoteResponse<HomeRemoteResponse>.fromJson(
          jsonDecode(response.body),
          (json) => HomeRemoteResponse.fromJson(json as Map<String, dynamic>),
        );

        print(baseResponseObject.data);
        if (baseResponseObject.status == null) {
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status?.code != 1) {
          return ResultError(message: baseResponseObject.status?.message);
          // return ResultError<HomeData>(message: "Error");
        } else {
          print(baseResponseObject.data);
          return ResultSuccess(baseResponseObject.data!.toHomeData());
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
