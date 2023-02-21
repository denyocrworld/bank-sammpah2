// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginStatusResponse _$LoginStatusResponseFromJson(Map<String, dynamic> json) =>
    LoginStatusResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginStatusResponseToJson(
        LoginStatusResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
