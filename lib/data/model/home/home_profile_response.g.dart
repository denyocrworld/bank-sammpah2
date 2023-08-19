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
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$HomeProfileResponseToJson(
        HomeProfileResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'username': instance.username,
      'balance': instance.balance,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };
