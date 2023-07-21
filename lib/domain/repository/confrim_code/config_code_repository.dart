import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/model/request/confirm_code_request/confirm_code.dart';

abstract class ConfigCodeRepository {
  Future<ResultEntity> submitConfirmCode(ConfirmCodeRequest request);
}
