import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/model/request/forgot_request/forgot_password.dart';


abstract class ForgotPasswordRepository {
  Future<ResultEntity> forgotPassword(ForgotPassword request);
}
