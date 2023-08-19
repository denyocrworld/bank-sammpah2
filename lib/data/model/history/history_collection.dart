// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'history_collection.g.dart';

abstract class HistoryCollectionResponseMapper {
  List toHomeRiwayatData();
}

@JsonSerializable()
class HistoryCollectionResponse implements HistoryCollectionResponseMapper {
  List? history;
  HistoryCollectionResponse({
    this.history,
  });

  factory HistoryCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCollectionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryCollectionResponseToJson(this);

  @override
  List toHomeRiwayatData() {
    // TODO: implement toHistoryData
    return history!.map((e) => e.toHomeRiwayatData()).toList();
  }
}
