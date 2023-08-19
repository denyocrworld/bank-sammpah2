part of 'layanan_cubit.dart';

class LayananState extends Equatable {
  const LayananState();

  @override
  List<Object> get props => [];
}

class LayananInitial extends LayananState {}

class LayananIsLoading extends LayananState {}

class LayananIsSuccess extends LayananState {
  LayananData data;
  LayananIsSuccess(
    this.data,
  );

  // @override
  // // TODO: implement props
  // List<Object> get props => [data];
}

class LayananIsError extends LayananState {
  String? message;
  LayananIsError({
    this.message,
  });
}
