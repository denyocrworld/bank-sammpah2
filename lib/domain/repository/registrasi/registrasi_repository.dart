import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/model/data/registrasi/registrasi__data.dart';
import 'package:loginandsignup/domain/model/request/Register/register_request.dart';

abstract class RegistrasiRepository {
  Future<ResultEntity<RegisterData>> submitRegister(
    RegisterRequest request, 
  );
}
