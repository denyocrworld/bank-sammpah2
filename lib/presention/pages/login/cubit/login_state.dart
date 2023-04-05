// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginIsLoading extends LoginState {}

class LoginIsSuccess extends LoginState {
  final LoginData data;
  LoginIsSuccess({
    required this.data,
  });
}

class LoginIsError extends LoginState {
  String? message;
  LoginIsError({
    this.message,
  });
}
