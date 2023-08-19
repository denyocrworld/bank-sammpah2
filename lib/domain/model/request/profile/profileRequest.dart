// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'profileRequest.g.dart';

@JsonSerializable()
class ProfileRequest {
  String image;
  String userName;
  String email;
  String phone;
  String address;
  ProfileRequest(
    this.image,
    this.userName,
    this.email,
    this.phone,
    this.address,
  );

  factory ProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestFromJson(json);
  Map<String, dynamic> toJson() {
    return _$ProfileRequestToJson(this);
  }
}
