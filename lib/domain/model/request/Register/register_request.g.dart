// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      json['name'] as String,
      json['phone_number'] as String,
      json['email'] as String,
      json['gender'] as int,
      json['password'] as String,
      json['password_confirm'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phone_number,
      'email': instance.email,
      'gender': instance.gender,
      'password': instance.password,
      'password_confirm': instance.password_confirm,
    };
