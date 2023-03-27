// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_riwayat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRiwayatResponse _$HomeRiwayatResponseFromJson(Map<String, dynamic> json) =>
    HomeRiwayatResponse(
      date: json['date'] as String?,
      price: json['price'] as int?,
      weight: json['weight'] as int?,
      point: json['point'] as int?,
    );

Map<String, dynamic> _$HomeRiwayatResponseToJson(
        HomeRiwayatResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'price': instance.price,
      'weight': instance.weight,
      'point': instance.point,
    };
