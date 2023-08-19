import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/detail_history/detail_history_data.dart';

abstract class DetailHistoryRepository {
  Future<ResultEntity<DetailHistoryData>> fecthDetailHistory(
      AuthenticationHeaderRequest header);
}
