import '../../../data/base/result_entity.dart';
import '../../base/authentication_header_request.dart';
import '../../model/data/token/token_data.dart';

abstract class TokenRepository {
  Future<ResultEntity<TokenData>> fetchRefreshToken(
      AuthenticationHeaderRequest header);
}
