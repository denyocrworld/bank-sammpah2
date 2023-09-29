// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/layanan/pickupData.dart';
import '../../../domain/model/data/layanan/bankSampahData.dart';
import '../../../domain/model/data/layanan/layananData.dart';
import 'bank_sampah_remote_response.dart';
import 'pick_up_remote_response.dart';

part 'layanan_remote_response.g.dart';

abstract class LayananResponseMapper {
  LayananData toLayananData();
}

@JsonSerializable()
class LayananResponse implements LayananResponseMapper {
  List<BankSampahResponse>? bank_sampah;
  List<PickUpResponse>? pick_up;
  LayananResponse({
    this.bank_sampah,
    this.pick_up,
  });

  factory LayananResponse.fromJson(Map<String, dynamic> json) =>
      _$LayananResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LayananResponseToJson(this);
  @override
  LayananData toLayananData() {
    List<BankSampahData> bankSampahDataList =
        bank_sampah?.map((response) => response.toBankSampahData()).toList() ??
            List.empty();
    List<PickUpData> listPickUp =
        pick_up?.map((response) => response.toPickUpData()).toList() ??
            List.empty();
    return LayananData(bankSampahDataList, listPickUp);
  }
}
