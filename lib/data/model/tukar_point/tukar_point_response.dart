// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/tukar_point/tukar_point_data.dart';

part 'tukar_point_response.g.dart';

abstract class TukarPointResponseMapper {
  TukarPointData toTukarPointData();
}

@JsonSerializable()
class TukarPointResponse implements TukarPointResponseMapper {
  int? point;
  TukarPointResponse({
    this.point,
  });

  factory TukarPointResponse.fromJson(Map<String, dynamic> json) =>
      _$TukarPointResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TukarPointResponseToJson(this);

  @override
  TukarPointData toTukarPointData() {
    return TukarPointData(point ?? 0);
  }
}
