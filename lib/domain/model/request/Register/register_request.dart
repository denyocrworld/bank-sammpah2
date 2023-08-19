import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String name;
  String phone_number;
  String email;
  int gender;
  String password;
  String password_confirm;
  RegisterRequest(
    this.name,
    this.phone_number,
    this.email,
    this.gender,
    this.password,
    this.password_confirm,
  );

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() {
    return _$RegisterRequestToJson(this);
  }
}
