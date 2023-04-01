import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/history/history_data.dart';

abstract class HistoryRepository {
  Future<ResultEntity<List<HistoryData>>> fecthHistory(
      AuthenticationHeaderRequest header);
}
