// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:loginandsignup/data/model/home/home_riwayat_response.dart';

import 'package:loginandsignup/domain/model/data/home/home_riwayat_data.dart';

part 'history_collection.g.dart';

abstract class HistoryCollectionResponseMapper {
  List<HomeRiwayatData> toHomeRiwayatData();
}

@JsonSerializable()
class HistoryCollectionResponse implements HistoryCollectionResponseMapper {
  List<HomeRiwayatResponse>? history;
  HistoryCollectionResponse({
    this.history,
  });

  factory HistoryCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCollectionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryCollectionResponseToJson(this);

  @override
  List<HomeRiwayatData> toHomeRiwayatData() {
    // TODO: implement toHistoryData
    return history!.map((e) => e.toHomeRiwayatData()).toList();
  }
}
