// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:loginandsignup/data/model/login/login_response.dart';
import 'package:loginandsignup/data/model/login/login_status_response.dart';
import 'package:loginandsignup/domain/model/login/login_data.dart';

part 'login_collection_remote_response.g.dart';

abstract class LoginCollectionRemoteResponseMapper {
  List<LoginData> toLoginData();
}

@JsonSerializable()
class LoginCollectionRemoteResponse
    implements LoginCollectionRemoteResponseMapper {
  LoginStatusResponse? status;
  List<LoginResponse>? data;

  LoginCollectionRemoteResponse({
    this.status,
    this.data,
  });

  factory LoginCollectionRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginCollectionRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginCollectionRemoteResponseToJson(this);

  @override
  List<LoginData> toLoginData() {
    return data?.map((e) => e.toLoginData()).toList() ?? List.empty();
  }
}
