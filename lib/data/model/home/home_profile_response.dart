// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/home/home_profile_data.dart';
part 'home_profile_response.g.dart';

abstract class HomeProfileResponseMapper {
  HomeProfileData toHomeProfileData();
}

@JsonSerializable()
class HomeProfileResponse implements HomeProfileResponseMapper {
  String? image;
  String? username;
  int? balance;
  String? email;
  String? phone;
  String? address;
  HomeProfileResponse({
    this.image,
    this.username,
    this.balance,
    this.email,
    this.phone,
    this.address,
  });

  factory HomeProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeProfileResponseToJson(this);
  @override
  HomeProfileData toHomeProfileData() {
    return HomeProfileData(image ?? "", username ?? "", balance ?? 0,
        email ?? "", phone ?? "", address ?? "");
  }
}
