import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/tukar_point/tukar_point_response.dart';
import 'package:loginandsignup/data/service/remote/tukar_point/tukar_point_remote_service.dart';
import 'package:loginandsignup/domain/model/data/tukar_point/tukar_point_data.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/repository/tukar_point/tukar_point_repository.dart';

class TukarPointRepositoryImpl implements TukarPointRepository {
  final tukarPointService = TukarPointRemoteService();

  @override
  Future<ResultEntity<TukarPointData>> fecthTukarPoint(
      AuthenticationHeaderRequest header) async {
    // TODO: implement fecthTukarPoint
    try {
      final response = await tukarPointService.fecthTukarPoint(header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<TukarPointResponse> baseResponseObject =
            BaseRemoteResponse<TukarPointResponse>.fromJson(
                jsonDecode(response.body),
                (json) => TukarPointResponse.fromJson(
                    (json) as Map<String, dynamic>));
        if (baseResponseObject.status == null) {
          return ResultError(message: "Status Null");
        } else if (baseResponseObject.status!.code != 0) {
          return ResultError(message: "Status Code Not Null");
        } else {
          return ResultSuccess(baseResponseObject.data!.toTukarPointData());
        }
      } else {
        return ResultError(message: "");
      }
    } catch (e) {
      print(e.toString());
      return ResultError(message: e.toString());
    }
  }
}
