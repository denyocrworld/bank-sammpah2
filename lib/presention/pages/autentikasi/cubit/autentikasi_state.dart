part of 'autentikasi_cubit.dart';

abstract class AutentikasiState extends Equatable {
  const AutentikasiState();

  @override
  List<Object> get props => [];
}

class AutentikasiInitial extends AutentikasiState {}

class AutentikasiIsLoading extends AutentikasiState {}

class AutentikasiIsError extends AutentikasiState {
  final String message;
  const AutentikasiIsError({
    required this.message,
  });
}

class AutentikasiIsSucess extends AutentikasiState {
  final String? message;
  const AutentikasiIsSucess({
    this.message,
  });
}
