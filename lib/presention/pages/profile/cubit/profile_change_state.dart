// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_const_constructors_in_immutables
part of 'profile_change_cubit.dart';

abstract class ProfileChangeState extends Equatable {
  const ProfileChangeState();

  @override
  List<Object> get props => [];
}

class ProfileChangeInitial extends ProfileChangeState {}

class ProfileChangeIsLoading extends ProfileChangeState {}

class ProfileChangeIsSuccess extends ProfileChangeState {
  final TokenData data;

  ProfileChangeIsSuccess({
    required this.data,
  });
}

class ProfileChangeIsError extends ProfileChangeState {
  String? message;
  ProfileChangeIsError({
    required this.message,
  });
}
