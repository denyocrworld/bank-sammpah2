// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/history/history_data.dart';

part 'history_response.g.dart';

abstract class HistoryResponseMapper {
  HistoryData toHistoryData();
}

@JsonSerializable()
class HistoryResponse implements HistoryResponseMapper {
  String? date;
  int? price;
  int? weight;
  int? point;
  HistoryResponse({
    this.date,
    this.price,
    this.weight,
    this.point,
  });

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryResponseToJson(this);

  @override
  HistoryData toHistoryData() {
    // TODO: implement toHistoryData
    return HistoryData(date ?? "", price ?? 0, weight ?? 0, point ?? 0);
  }
}
