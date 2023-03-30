import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/repository/forgot-password/forgot_password_repository.dart';

part 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  ForgotPasswordRepository repository;
  ForgotPassCubit(this.repository) : super(ForgotPassInitial());

  Future<void> submitForgotPassword(String email) async {
    emit(ForgotPassIsLoading());
    final response = await repository.submitForgotPassword(email);
    if (response is ResultSuccess) {
      if (response.data == null) {
        emit(ForgotPassIsSuccess(message: ""));
      }
    } else if (response is ResultError) {
      emit(ForgotPassIsError(message: response.message!));
    }
  }
}
