// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'config_pass_cubit.dart';

abstract class ConfigPassState extends Equatable {
  const ConfigPassState();

  @override
  List<Object> get props => [];
}

class ConfigPassInitial extends ConfigPassState {}

class ConfigPassIsLoading extends ConfigPassState {}

class ConfigPassIsError extends ConfigPassState {
  String? message;
  ConfigPassIsError({
    required this.message,
  });
}

class ConfigPassIsSuccess extends ConfigPassState {
  final HomeProfileData data;
  ConfigPassIsSuccess({
    required this.data,
  });
}
