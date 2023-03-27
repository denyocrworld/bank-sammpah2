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
  String? userName;
  int? balance;
  HomeProfileResponse({
    this.image,
    this.userName,
    this.balance,
  });

  factory HomeProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeProfileResponseToJson(this);
  @override
  HomeProfileData toHomeProfileData() {
    return HomeProfileData(image ?? "", userName ?? "", balance ?? 0);
  }
}
