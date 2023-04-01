// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) =>
    HistoryResponse(
      date: json['date'] as String?,
      price: json['price'] as int?,
      weight: json['weight'] as int?,
      point: json['point'] as int?,
    );

Map<String, dynamic> _$HistoryResponseToJson(HistoryResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'price': instance.price,
      'weight': instance.weight,
      'point': instance.point,
    };
