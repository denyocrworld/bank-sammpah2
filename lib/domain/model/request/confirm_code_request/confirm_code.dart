import 'package:json_annotation/json_annotation.dart';
part 'confirm_code.g.dart';

@JsonSerializable()
class ConfirmCodeRequest {
  final String? code;
  ConfirmCodeRequest({
    this.code,
  });

  factory ConfirmCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmCodeRequestFromJson(json);
  Map<String, dynamic> toJson() {
    return _$ConfirmCodeRequestToJson(this);
  }
}
