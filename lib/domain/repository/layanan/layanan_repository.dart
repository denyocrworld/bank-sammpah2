import 'package:loginandsignup/data/base/result_entity.dart';
import '../../base/authentication_header_request.dart';
import '../../model/data/layanan/layananData.dart';

abstract class LayananRepository {
  Future<ResultEntity<LayananData>> fetchLayanan(
      AuthenticationHeaderRequest header);
}
