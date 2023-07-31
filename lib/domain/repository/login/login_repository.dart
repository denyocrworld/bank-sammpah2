import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/model/data/login/login_data.dart';
import 'package:loginandsignup/domain/model/request/login/login_request.dart';

abstract class LoginRepository {
  Future<ResultEntity<LoginData>> submitLogin(
    LoginRequest request,
  );
}
