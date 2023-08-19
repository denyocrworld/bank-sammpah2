// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRequest _$ProfileRequestFromJson(Map<String, dynamic> json) =>
    ProfileRequest(
      json['image'] as String,
      json['userName'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['address'] as String,
    );

Map<String, dynamic> _$ProfileRequestToJson(ProfileRequest instance) =>
    <String, dynamic>{
      'image': instance.image,
      'userName': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };
