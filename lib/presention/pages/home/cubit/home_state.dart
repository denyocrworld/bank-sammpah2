// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeIsLoading extends HomeState {}

class HomeIsSuccess extends HomeState {
  HomeData data;
  HomeIsSuccess(
    this.data,
  );

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class HomeIsError extends HomeState {
  String? message;
  HomeIsError({
    this.message,
  });
}
