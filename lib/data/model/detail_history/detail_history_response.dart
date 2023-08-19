// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/detail_history/detail_history_data.dart';

part 'detail_history_response.g.dart';

abstract class DetailHistoryResponseMapper {
  DetailHistoryData toDetailHistoryData();
}

@JsonSerializable()
class DetailHistoryResponse implements DetailHistoryResponseMapper {
  String? pickup_address;
  String? date;
  double? price;
  double? weight;
  String? image;
  DetailHistoryResponse({
    this.pickup_address,
    this.date,
    this.price,
    this.weight,
    this.image,
  });

  factory DetailHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailHistoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DetailHistoryResponseToJson(this);

  @override
  DetailHistoryData toDetailHistoryData() {
    // TODO: implement toDetailHistoryData
    return DetailHistoryData(
        pickup_address ?? "", date ?? "", price ?? 0, weight ?? 0, image ?? "");
  }
}
