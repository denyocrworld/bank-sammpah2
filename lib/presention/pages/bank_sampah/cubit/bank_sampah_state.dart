// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bank_sampah_cubit.dart';

abstract class BankSampahState extends Equatable {
  const BankSampahState();

  @override
  List<Object> get props => [];
}

class BankSampahInitial extends BankSampahState {}

class BankSampahIsLoading extends BankSampahState {}

class BankSampahIsSuccess extends BankSampahState {
  final List<BankSampahData> data;
  BankSampahIsSuccess(
    this.data,
  );
}

class BankSampahIsError extends BankSampahState {
  String? message;
  BankSampahIsError({
    this.message,
  });
}
