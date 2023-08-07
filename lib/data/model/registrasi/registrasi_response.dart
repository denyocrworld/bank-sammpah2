import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/domain/model/data/registrasi/registrasi__data.dart';

part 'registrasi_response.g.dart';

abstract class RegisterResponseMapper {
  RegisterData toRegisterData();
}

@JsonSerializable()
class RegisterResponse implements RegisterResponseMapper {
  String? token;
  RegisterResponse({
    this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
  @override
  RegisterData toRegisterData() {
    return RegisterData(token: token ?? '');
  }
}
