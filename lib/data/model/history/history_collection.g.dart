// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryCollectionResponse _$HistoryCollectionResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryCollectionResponse(
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => HistoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryCollectionResponseToJson(
        HistoryCollectionResponse instance) =>
    <String, dynamic>{
      'history': instance.history,
    };
