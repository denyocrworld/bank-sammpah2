
import '../../../data/base/result_entity.dart';
import '../../base/authentication_header_request.dart';
import '../../model/request/profile/profileRequest.dart';

abstract class ChangeProfileRepository {
  Future<ResultEntity> fetchChangeProfile(
      ProfileRequest request, AuthenticationHeaderRequest header);
}
