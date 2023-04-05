// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProfileResponse _$HomeProfileResponseFromJson(Map<String, dynamic> json) =>
    HomeProfileResponse(
      image: json['image'] as String?,
      userName: json['userName'] as String?,
      balance: json['balance'] as int?,
    );

Map<String, dynamic> _$HomeProfileResponseToJson(
        HomeProfileResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'userName': instance.userName,
      'balance': instance.balance,
    };
