// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'layanan_cubit.dart';

class LayananState extends Equatable {
  const LayananState();

  @override
  List<Object> get props => [];
}

class LayananInitial extends LayananState {}

class LayananIsLoading extends LayananState {
  // int futureDelayed;
  // LayananIsLoading({
  //   required this.futureDelayed,
  // });
}

class LayananIsSuccess extends LayananState {
  final LayananData data;
  const LayananIsSuccess({
    required this.data,
  });
}

class LayananIsError extends LayananState {
  String? message;
  LayananIsError({
    this.message,
  });
}
