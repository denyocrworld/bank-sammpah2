// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layanan_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayananResponse _$LayananResponseFromJson(Map<String, dynamic> json) =>
    LayananResponse(
      bank_sampah: (json['bank_sampah'] as List<dynamic>?)
          ?.map((e) => BankSampahResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pick_up: (json['pick_up'] as List<dynamic>?)
          ?.map((e) => PickUpResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LayananResponseToJson(LayananResponse instance) =>
    <String, dynamic>{
      'bank_sampah': instance.bank_sampah,
      'pick_up': instance.pick_up,
    };
