// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'status_response.g.dart';

@JsonSerializable()
class StatusResponse {
  // @JsonKey(name: 'Code')
  int? code;
  // @JsonKey(name: 'Message')
  String? message;

  StatusResponse({
    this.code,
    this.message,
  });

  factory StatusResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatusResponseToJson(this);
}
