import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/token_request_header.dart';
import 'package:loginandsignup/domain/model/data/home/home_profile_data.dart';
import 'package:loginandsignup/domain/model/request/confirm_code_request/confirm_code.dart';

abstract class ConfigCodeRepository {
  Future<ResultEntity<HomeProfileData>>submitConfirmCode(ConfirmCodeRequest request, TokenHeaderRequest email);
}
