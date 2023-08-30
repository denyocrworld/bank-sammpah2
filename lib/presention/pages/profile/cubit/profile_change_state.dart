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
  final HomeData data;
  const ProfileChangeIsSuccess({
    required this.data,
  });
}

class ProfileChangeIsError extends ProfileChangeState {
  String? message;
  ProfileChangeIsError({
    required this.message,
  });
}
