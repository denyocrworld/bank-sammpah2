// ignore_for_file: must_be_immutable

part of 'new_inquiry_cubit.dart';

class NewInquiryState extends Equatable {
  const NewInquiryState();

  @override
  List<Object> get props => [];
}

class NewInquiryInitial extends NewInquiryState {}

class NewInquiryIsLoading extends NewInquiryState {}

class NewInquiryIsSuccess extends NewInquiryState {
  String? message;
  NewInquiryIsSuccess({
    this.message,
  });
}

class NewInquiryIsError extends NewInquiryState {
  String? message;
  NewInquiryIsError({
    required this.message,
  });
}
