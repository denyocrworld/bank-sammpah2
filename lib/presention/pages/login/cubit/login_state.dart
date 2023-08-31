// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginIsLoading extends LoginState {}

class LoginSucces extends LoginState {
  final LoginData data;
  const LoginSucces({
    required this.data,
  });
}

class LoginIsError extends LoginState {
  String? message;
  LoginIsError({
    this.message,
  });
}
