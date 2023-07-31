// ignore_for_file: public_member_api_docs, sort_constructors_fir

import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/data/model/home/home_profile_response.dart';
import 'package:loginandsignup/domain/model/data/home/home_data.dart';

part 'home_remote_response.g.dart';

abstract class HomeRemoteResponseMapper {
  HomeData toHomeData();
}

@JsonSerializable()
class HomeRemoteResponse implements HomeRemoteResponseMapper {
  final HomeProfileResponse? profile;
  final List<dynamic>? riwayat;
  HomeRemoteResponse({
    this.profile,
    this.riwayat,
  });

  factory HomeRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeRemoteResponseToJson(this);

  @override
  HomeData toHomeData() {
    // TODO: implement toHomeData
    return HomeData(
      profile!.toHomeProfileData(),
      riwayat!,
    );
  }
}
