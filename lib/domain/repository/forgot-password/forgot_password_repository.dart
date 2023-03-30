import 'package:loginandsignup/data/base/result_entity.dart';

abstract class ForgotPasswordRepository {
  Future<ResultEntity> submitForgotPassword(String email);
}
