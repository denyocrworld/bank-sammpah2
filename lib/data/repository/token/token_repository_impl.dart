// ignore_for_file: avoid_print

import 'dart:convert';

import '../../../domain/base/authentication_header_request.dart';
import '../../../domain/model/data/token/token_data.dart';
import '../../../domain/repository/token/token_repository.dart';
import '../../base/result_entity.dart';
import '../../model/base_response/base_remote_response.dart';
import '../../model/token/token_response.dart';
import '../../service/remote/token/token_service.dart';

class TokenRepositoryImpl implements TokenRepository {
  final tokenService = TokenRemoteService();

  @override
  Future<ResultEntity<TokenData>> fetchRefreshToken(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await tokenService.fetchRefreshToken(header);
      print("STATUS CODE :${response.statusCode} ");
      print("DATA :${response.body} ");

      if (response.statusCode == 200 || response.statusCode == 401) {
        BaseRemoteResponse<TokenResponse> baseResponseObject =
            BaseRemoteResponse<TokenResponse>.fromJson(
          jsonDecode(response.body),
          (json) => TokenResponse.fromJson(json as Map<String, dynamic>),
        );
        print(baseResponseObject.data);
        if (baseResponseObject.status == null) {
          return ResultError(message: baseResponseObject.status!.message);
        } else if (baseResponseObject.status?.code != 1) {
          return ResultError(message: baseResponseObject.status?.message);
          // return ResultError<TokenData>(message: "Error");
        } else {
          print(baseResponseObject.data);
          return ResultSuccess(baseResponseObject.data!.toTokenData());
        }
      } else {
        print("Error Impl Token:${response.toString()}");
        return ResultError(message: response.toString());
      }
    } catch (e) {
      print("ERROR IMPL Token: ${e.toString()}");
      return ResultError(message: e.toString());
    }
  }
}
