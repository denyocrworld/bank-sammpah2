import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/model/data/home/home_data.dart';
import 'package:loginandsignup/domain/model/data/home/home_profile_data.dart';
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
          ForgotPassIsSuccess(message: 'Forgot Password Success'),
        );
      } else {
        emit(
          ForgotPassIsSuccess(data: (response as ResultSuccess).data),
        );
        final data = (state as ForgotPassIsSuccess).data;
        Commons().setUid(data!.email.toString());
      }
    } else if (response is ResultError) {
      emit(ForgotPassIsError(message: "Email tidak terdaftar"));
    }
  }
}
