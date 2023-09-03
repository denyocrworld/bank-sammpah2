import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/base/result_entity.dart';
import '../../../../domain/base/authentication_header_request.dart';
import '../../../../data/utilities/commons.dart';
import '../../../../domain/model/request/new-inquiry/new_inquiry_request.dart';
import '../../../../domain/repository/new-inquiry/new_inquiry_repository.dart';
// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, depend_on_referenced_packages
part 'new_inquiry_state.dart';

class NewInquiryCubit extends Cubit<NewInquiryState> {
  final NewInquiryRepository repository;
  NewInquiryCubit(this.repository) : super(NewInquiryInitial());

  Future<void> addQuiry(NewInquiryRequest request) async {
    final token = await Commons().getUid();
    print('ini token new inquiry = ${token}');
    emit(NewInquiryIsLoading());
    final response =
        await repository.addQuiry(request, AuthenticationHeaderRequest(token!));

    print(response);
    if (response is ResultSuccess) {
      emit(
        NewInquiryIsSuccess(message: (response).data),
      );
    } else {
      emit(NewInquiryIsError(message: (response as ResultError).message));
      print((response).message);
    }
  }
}
