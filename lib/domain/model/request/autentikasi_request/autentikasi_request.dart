import 'package:json_annotation/json_annotation.dart';
part 'autentikasi_request.g.dart';

@JsonSerializable()
class Autentikasi {
  String otp;
  Autentikasi(
    this.otp,
  );

  factory Autentikasi.fromJson(Map<String, dynamic> json) =>
      _$AutentikasiFromJson(json);
  Map<String, dynamic> toJson() {
    return _$AutentikasiToJson(this);
  }
}
