// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/data/layanan/bankSampahData.dart';
part 'bank_sampah_remote_response.g.dart';

abstract class BankSampahResponseMapper {
  BankSampahData toBankSampahData();
}

@JsonSerializable()
class BankSampahResponse implements BankSampahResponseMapper {
  String? layanan;
  int? point;
  BankSampahResponse({
    this.layanan,
    this.point,
  });

  factory BankSampahResponse.fromJson(Map<String, dynamic> json) =>
      _$BankSampahResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BankSampahResponseToJson(this);
  @override
  BankSampahData toBankSampahData() {
    return BankSampahData(layanan ?? "", point!, 0);
  }
}
