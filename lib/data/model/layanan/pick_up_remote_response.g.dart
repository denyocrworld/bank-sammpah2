// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_up_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickUpResponse _$PickUpResponseFromJson(Map<String, dynamic> json) =>
    PickUpResponse(
      layanan: json['layanan'] as String?,
      price: json['price'] as int?,
      point: json['point'] as int?,
    );

Map<String, dynamic> _$PickUpResponseToJson(PickUpResponse instance) =>
    <String, dynamic>{
      'layanan': instance.layanan,
      'price': instance.price,
      'point': instance.point,
    };
