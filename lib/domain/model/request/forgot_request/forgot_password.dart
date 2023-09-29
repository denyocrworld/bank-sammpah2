import 'package:json_annotation/json_annotation.dart';
part 'forgot_password.g.dart';

@JsonSerializable()
class ForgotPassword {
  String email;
  ForgotPassword(
    this.email,
  );

  factory ForgotPassword.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordFromJson(json);
  Map<String, dynamic> toJson() {
    return _$ForgotPasswordToJson(this);
  }
}
