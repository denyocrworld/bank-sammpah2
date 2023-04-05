// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProfileResponse _$HomeProfileResponseFromJson(Map<String, dynamic> json) =>
    HomeProfileResponse(
      image: json['image'] as String?,
      username: json['username'] as String?,
      balance: json['balance'] as int?,
    );

Map<String, dynamic> _$HomeProfileResponseToJson(
        HomeProfileResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'username': instance.username,
      'balance': instance.balance,
    };
