
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';

abstract class LogoutRepository{
  Future<ResultEntity> logout(AuthenticationHeaderRequest header);
}