import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/detail_history/detail_history_response.dart';
import 'package:loginandsignup/data/service/remote/detail_riwayat/detail_history_remote_service.dart';
import 'package:loginandsignup/domain/model/data/detail_history/detail_history_data.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/repository/detail_history/detail_history_repository.dart';

class DetailHistoryRepositoryImpl implements DetailHistoryRepository {
  final detailHistoryService = DetailHistoryRemoteService();

  @override
  Future<ResultEntity<DetailHistoryData>> fecthDetailHistory(
      AuthenticationHeaderRequest header) async {
    // TODO: implement fecthDetailHistory
    try {
      final response = await detailHistoryService.fecthDetailHistory(header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<DetailHistoryResponse> baseResponseObject =
            BaseRemoteResponse<DetailHistoryResponse>.fromJson(
                jsonDecode(response.body),
                (json) => DetailHistoryResponse.fromJson(
                    json as Map<String, dynamic>));
        DetailHistoryResponse.fromJson(jsonDecode(response.body));
        if (baseResponseObject.status == null) {
          return ResultError(message: "Status Null");
        } else if (baseResponseObject.status!.code != 0) {
          return ResultError(message: "Status Code Not Null");
        } else {
          return ResultSuccess(baseResponseObject.data!.toDetailHistoryData());
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
