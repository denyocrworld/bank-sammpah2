// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forgot_pass_cubit.dart';

abstract class ForgotPassState extends Equatable {
  const ForgotPassState();

  @override
  List<Object> get props => [];
}

class ForgotPassInitial extends ForgotPassState {}

class ForgotPassIsLoading extends ForgotPassState {}

class ForgotPassIsError extends ForgotPassState {
  final String message;
  const ForgotPassIsError({
    required this.message,
  });
}

class ForgotPassIsSuccess extends ForgotPassState {
  final String? message;
  final HomeProfileData? data;
  const ForgotPassIsSuccess({
    this.data,
    this.message,
  });
}
