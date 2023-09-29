// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_sampah_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankSampahResponse _$BankSampahResponseFromJson(Map<String, dynamic> json) =>
    BankSampahResponse(
      type: json['type'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      point: json['point'] as int?,
    );

Map<String, dynamic> _$BankSampahResponseToJson(BankSampahResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'image': instance.image,
      'name': instance.name,
      'point': instance.point,
    };
