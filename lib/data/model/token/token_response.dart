// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/data/token/token_data.dart';

part 'token_response.g.dart';

abstract class TokenResponseMapper {
  TokenData toTokenData();
}

@JsonSerializable()
class TokenResponse implements TokenResponseMapper {
  String? token;

  TokenResponse({
    this.token,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
  @override
  TokenData toTokenData() {
    return TokenData(token ?? "");
  }
}
