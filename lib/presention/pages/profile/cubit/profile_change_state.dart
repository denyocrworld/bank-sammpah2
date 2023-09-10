// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'profile_change_cubit.dart';

abstract class ProfileChangeState extends Equatable {
  const ProfileChangeState();

  @override
  List<Object> get props => [];
}

class ProfileChangeInitial extends ProfileChangeState {}

class ProfileChangeIsLoading extends ProfileChangeState {}

class ProfileChangeIsSuccess extends ProfileChangeState {
  String? message;

  ProfileChangeIsSuccess({
    this.message,
  });
}

class ProfileChangeIsError extends ProfileChangeState {
  String? message;
  ProfileChangeIsError({
    required this.message,
  });
}
