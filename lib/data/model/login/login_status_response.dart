import 'package:json_annotation/json_annotation.dart'; // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:loginandsignup/domain/model/login/login_status_data.dart';

part 'login_status_response.g.dart';

abstract class LoginStatusResponseMapper {
  LoginStatusData toLoginStatusData();
}

@JsonSerializable()
class LoginStatusResponse implements LoginStatusResponseMapper {
  int? code;
  String? message;
  LoginStatusResponse({
    this.code,
    this.message,
  });

  factory LoginStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginStatusResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginStatusResponseToJson(this);
  @override
  LoginStatusData toLoginStatusData() {
    return LoginStatusData(code!, message ?? "");
  }
}
