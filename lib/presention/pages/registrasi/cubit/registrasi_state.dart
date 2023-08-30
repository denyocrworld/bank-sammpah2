// ignore_for_file: must_be_immutable

part of 'registrasi_cubit.dart';

abstract class RegistrasiState extends Equatable {
  const RegistrasiState();

  @override
  List<Object> get props => [];
}

class RegistrasiInitial extends RegistrasiState {}

class RegistrasiIsLoading extends RegistrasiState {}

class RegistrasiIsSucces extends RegistrasiState {
  final RegisterData data;
  const RegistrasiIsSucces({required this.data});
}

class RegistrasiIsError extends RegistrasiState {
  String? message;
  RegistrasiIsError({this.message});
}
