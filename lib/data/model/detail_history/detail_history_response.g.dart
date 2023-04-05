// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailHistoryResponse _$DetailHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    DetailHistoryResponse(
      pickup_address: json['pickup_address'] as String?,
      date: json['date'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DetailHistoryResponseToJson(
        DetailHistoryResponse instance) =>
    <String, dynamic>{
      'pickup_address': instance.pickup_address,
      'date': instance.date,
      'price': instance.price,
      'weight': instance.weight,
      'image': instance.image,
    };
