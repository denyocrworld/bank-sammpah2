import 'dart:convert';

import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/model/base_response/base_remote_response.dart';
import 'package:loginandsignup/data/model/history/history_collection.dart';
import 'package:loginandsignup/data/model/history/history_response.dart';
import 'package:loginandsignup/data/service/remote/history/history_remote_service.dart';
import 'package:loginandsignup/domain/model/data/history/history_data.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/repository/history/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final historyService = HistoryRemoteService();
  @override
  Future<ResultEntity<List<HistoryData>>> fecthHistory(
      AuthenticationHeaderRequest header) async {
    // TODO: implement fecthHistory
    try {
      final response = await historyService.fecthHistory(header);
      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<List<HistoryResponse>> baseResponseArray =
            BaseRemoteResponse<List<HistoryResponse>>.fromJson(
                jsonDecode(response.body),
                (json) => (json as List)
                    .map((e) =>
                        HistoryResponse.fromJson(e as Map<String, dynamic>))
                    .toList());
        if (baseResponseArray.status == null) {
          print(baseResponseArray.status);
          return ResultError(message: baseResponseArray.status!.message);
        } else if (baseResponseArray.status?.code != 0) {
          print(baseResponseArray.status!.code);
          return ResultError(message: "");
        } else {
          print(baseResponseArray.data);
          return ResultSuccess(
              baseResponseArray.data!.map((e) => e.toHistoryData()).toList());
        }
      } else {
        print(response.statusCode);
        return ResultError(message: "");
      }
    } catch (e) {
      print(e.toString());
      return ResultError(message: e.toString());
    }
  }
}
