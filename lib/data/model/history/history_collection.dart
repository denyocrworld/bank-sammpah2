// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/data/model/history/history_response.dart';
import 'package:loginandsignup/domain/model/data/history/history_data.dart';

part 'history_collection.g.dart';

abstract class HistoryCollectionResponseMapper {
  List<HistoryData> toHistoryData();
}

@JsonSerializable()
class HistoryCollectionResponse implements HistoryCollectionResponseMapper {
  List<HistoryResponse>? history;
  HistoryCollectionResponse({
    this.history,
  });

  factory HistoryCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCollectionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryCollectionResponseToJson(this);

  @override
  List<HistoryData> toHistoryData() {
    // TODO: implement toHistoryData
    return history!.map((e) => e.toHistoryData()).toList();
  }
}
