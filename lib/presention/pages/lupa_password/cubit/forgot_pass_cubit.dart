// ignore_for_file: avoid_print

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/model/request/forgot_request/forgot_password.dart';
import 'package:loginandsignup/domain/repository/forgot-password/forgot_password_repository.dart';

part 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  final ForgotPasswordRepository repository;
  ForgotPassCubit(this.repository) : super(ForgotPassInitial());

  Future<void> btnForgotPass(ForgotPassword request) async {
    print('Fetch Forgot Password ');
    emit(ForgotPassIsLoading());
    final response = await repository.forgotPassword(request);
    if (response is ResultSuccess) {
      if (response.data == null) {
        emit(
          const ForgotPassIsSuccess(message: 'Forgot Password Success'),
        );
      } else {
        emit(
          ForgotPassIsSuccess(message: (response).data),
        );
        // final data = (state as ForgotPassIsSuccess).message;
        // final token = (state as ForgotPassIsSuccess).message;

        // Commons().setEmail(data!, token!);
      }
    } else if (response is ResultError) {
      emit(const ForgotPassIsError(message: "Email tidak terdaftar"));
    }
  }
}
