// ignore_for_file: must_be_immutable

part of 'logout_cubit.dart';

class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutIsSucces extends LogoutState {
  String? message;
  LogoutIsSucces({
    this.message,
  });
}

class LogoutIsError extends LogoutState {
  String? message;
  LogoutIsError({
    this.message,
  });
}
