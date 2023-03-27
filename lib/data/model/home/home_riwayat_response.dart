// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/home/home_riwayat_data.dart';

part 'home_riwayat_response.g.dart';

abstract class HomeRiwayatResponseMapper {
  HomeRiwayatData toHomeRiwayatData();
}

@JsonSerializable()
class HomeRiwayatResponse implements HomeRiwayatResponseMapper {
  String? date;
  int? price;
  int? weight;
  int? point;
  HomeRiwayatResponse({
    this.date,
    this.price,
    this.weight,
    this.point,
  });

  factory HomeRiwayatResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeRiwayatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeRiwayatResponseToJson(this);

  @override
  HomeRiwayatData toHomeRiwayatData() {
    return HomeRiwayatData(date ?? "", price ?? 0, weight ?? 0, point ?? 0);
  }
}
