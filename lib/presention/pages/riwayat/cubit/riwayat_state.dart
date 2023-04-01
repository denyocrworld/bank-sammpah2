// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'riwayat_cubit.dart';

abstract class RiwayatState extends Equatable {
  const RiwayatState();

  @override
  List<Object> get props => [];
}

class RiwayatInitial extends RiwayatState {}

class RiwayatIsLoading extends RiwayatState {}

class RiwayatIsSuccess extends RiwayatState {
  final List<HistoryData> history;
  RiwayatIsSuccess(
    this.history,
  );
}

class RiwayatIsError extends RiwayatState {
  String? message;
  RiwayatIsError({
    this.message,
  });
}
