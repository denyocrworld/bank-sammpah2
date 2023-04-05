import 'package:loginandsignup/data/base/result_entity.dart';

abstract class ConfigCodeRepository {
  Future<ResultEntity> submitConfigCode(String kode);
}
