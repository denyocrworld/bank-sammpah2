// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'bank_sampah_cubit.dart';

class BankSampahState extends Equatable {
  const BankSampahState();

  @override
  List<Object> get props => [];
}

class BankSampahInitial extends BankSampahState {}

class BankSampahIsLoading extends BankSampahState {}

class BankSampahIsSuccess extends BankSampahState {
  final LayananData data;
  const BankSampahIsSuccess({
    required this.data,
  });
}

class BankSampahIsError extends BankSampahState {
  String? message;
  BankSampahIsError({
    this.message,
  });
}
