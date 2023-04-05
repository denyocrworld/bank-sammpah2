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
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<HomeRemoteResponse> baseResponseObject =
            BaseRemoteResponse<HomeRemoteResponse>.fromJson(
                jsonDecode(response.body),
                (json) =>
                    HomeRemoteResponse.fromJson(json as Map<String, dynamic>));
        if (baseResponseObject.status == null) {
          print(baseResponseObject.status);
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status?.code != 0) {
          print(baseResponseObject.status!.code);
          // return ResultError(message: baseResponseObject.status?.message);
          return ResultError<HomeData>(message: "Error");
        } else {
          print(baseResponseObject.data);
          return ResultSuccess(baseResponseObject.data!.toHomeData());
        }
      } else {
        print(response.statusCode);
        return ResultError<HomeData>(message: "Error");
      }
    } catch (e) {
      print(e.toString());
      return ResultError(message: e.toString());
    }
  }
}
