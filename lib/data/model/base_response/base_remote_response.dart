// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:loginandsignup/data/model/base_response/status_response.dart';
part 'base_remote_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: true)
class BaseRemoteResponse<R> {
  StatusResponse? status;
  R? data;

  BaseRemoteResponse({
    this.status,
    this.data,
  });

  factory BaseRemoteResponse.fromJson(
          Map<String, dynamic> json, R Function(Object? json) fromJsonR) =>
      _$BaseRemoteResponseFromJson(json, fromJsonR);

  Map<String, dynamic> toJson(Object Function(R value) toJsonR) =>
      _$BaseRemoteResponseToJson(this, toJsonR);
}
