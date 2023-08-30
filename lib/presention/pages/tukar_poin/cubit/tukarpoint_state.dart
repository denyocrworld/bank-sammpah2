// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'tukarpoint_cubit.dart';

abstract class TukarpointState extends Equatable {
  const TukarpointState();

  @override
  List<Object> get props => [];
}

class TukarpointInitial extends TukarpointState {}

class TukarpointIsLoading extends TukarpointState {}

class TukarpointIsSuccess extends TukarpointState {
  TukarPointData data;
  TukarpointIsSuccess(
    this.data,
  );
}

class TukarpointIsError extends TukarpointState {
  String? message;
  TukarpointIsError({
    this.message,
  });
}
