// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeIsLoading extends HomeState {}

class HomeIsSuccess extends HomeState {
  HomeData data;
  HomeIsSuccess({required this.data});
}

class HomeIsError extends HomeState {
  String? message;
  HomeIsError({
    this.message,
  });
}
