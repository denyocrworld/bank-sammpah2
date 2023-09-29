import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/model/request/autentikasi_request/autentikasi_request.dart';

abstract class AutentikasiRepository {
  Future<ResultEntity> autentikasi(Autentikasi request);
}