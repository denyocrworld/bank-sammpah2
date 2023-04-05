// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String whatsappEmail;
  String pass;
  LoginRequest(
    this.whatsappEmail,
    this.pass,
  );

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() {
    return _$LoginRequestToJson(this);
  }
}
