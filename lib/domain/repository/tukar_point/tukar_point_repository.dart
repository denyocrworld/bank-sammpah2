import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/tukar_point/tukar_point_data.dart';

abstract class TukarPointRepository {
  Future<ResultEntity<TukarPointData>> fecthTukarPoint(
      AuthenticationHeaderRequest header);
}
