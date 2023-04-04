// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detal_history_cubit.dart';

abstract class DetalHistoryState extends Equatable {
  const DetalHistoryState();

  @override
  List<Object> get props => [];
}

class DetalHistoryInitial extends DetalHistoryState {}

class DetalHistoryIsLoading extends DetalHistoryState {}

class DetalHistoryIsSuccess extends DetalHistoryState {
  final DetailHistoryData data;
  DetalHistoryIsSuccess(
    this.data,
  );
}

class DetalHistoryIsError extends DetalHistoryState {
  String? message;
  DetalHistoryIsError({
    this.message,
  });
}
