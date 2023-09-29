import 'package:equatable/equatable.dart';

abstract class ResultEntity<D> extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResultSuccess<D> implements ResultEntity<D> {
  final D data;

  ResultSuccess(this.data);

  @override
  List<Object?> get props => [data];

  @override
  bool? get stringify => true;
}

class ResultError<D> implements ResultEntity<D> {
  final String? message;

  ResultError({this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
