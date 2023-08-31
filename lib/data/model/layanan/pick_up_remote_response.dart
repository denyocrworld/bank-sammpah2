// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/data/layanan/pickupData.dart';
part 'pick_up_remote_response.g.dart';

abstract class PickUpResponseMapper {
  PickUpData toPickUpData();
}

@JsonSerializable()
class PickUpResponse implements PickUpResponseMapper {
  String? layanan;
  int? price;
  int? point;
  PickUpResponse({
    this.layanan,
    this.price,
    this.point,
  });

  factory PickUpResponse.fromJson(Map<String, dynamic> json) =>
      _$PickUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PickUpResponseToJson(this);
  @override
  PickUpData toPickUpData() {
    return PickUpData(layanan ?? "", price ?? 0, point ?? 0);
  }
}
