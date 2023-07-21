import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/login/login_data.dart';

part 'login_response.g.dart';

abstract class LoginResponseMapper {
  LoginData toLoginData();
}

@JsonSerializable()
class LoginResponse implements LoginResponseMapper {
  String? token;

  LoginResponse({
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
  @override
  LoginData toLoginData() {
    return LoginData(token: token ?? '');
  }
}
