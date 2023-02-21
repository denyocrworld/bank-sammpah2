// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_collection_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCollectionRemoteResponse _$LoginCollectionRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    LoginCollectionRemoteResponse(
      status: json['status'] == null
          ? null
          : LoginStatusResponse.fromJson(
              json['status'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LoginResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoginCollectionRemoteResponseToJson(
        LoginCollectionRemoteResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
