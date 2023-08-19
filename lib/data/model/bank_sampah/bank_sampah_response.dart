// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/bank_sampah/bank_sampah_data.dart';

part 'bank_sampah_response.g.dart';

abstract class BankSampahResponseMapper {
  BankSampahData toBankSampahData();
}

@JsonSerializable()
class BankSampahResponse implements BankSampahResponseMapper {
  int? type;
  String? image;
  String? name;
  int? point;
  BankSampahResponse({
    this.type,
    this.image,
    this.name,
    this.point,
  });

  factory BankSampahResponse.fromJson(Map<String, dynamic> json) =>
      _$BankSampahResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BankSampahResponseToJson(this);

  @override
  BankSampahData toBankSampahData() {
    // TODO: implement toBankSampahData
    return BankSampahData(type ?? 0, image ?? "", name ?? "", point ?? 0);
  }
}
