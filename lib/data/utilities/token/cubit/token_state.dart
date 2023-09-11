// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables
part of 'token_cubit.dart';

class TokenState extends Equatable {
  const TokenState();

  @override
  List<Object> get props => [];
}

class TokenInitial extends TokenState {}

class TokenIsLoading extends TokenState {}

class TokenIsSucces extends TokenState {
  final TokenData data;
  TokenIsSucces({
    required this.data,
  });
}

class TokenIsError extends TokenState {
  final String message;
  TokenIsError({
    required this.message,
  });
}
