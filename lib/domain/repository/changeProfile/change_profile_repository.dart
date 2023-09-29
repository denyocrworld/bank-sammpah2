import '../../../data/base/result_entity.dart';
import '../../base/authentication_header_request.dart';
import '../../model/data/token/token_data.dart';
import '../../model/request/profile/profileRequest.dart';

abstract class ChangeProfileRepository {
  Future<ResultEntity<TokenData>> fetchChangeProfile(
      ProfileRequest request, AuthenticationHeaderRequest header);
}
