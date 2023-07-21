import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/model/data/login/login_data.dart';
import 'package:loginandsignup/domain/model/request/login/login_request.dart';

import 'package:loginandsignup/domain/repository/login/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;
  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> btnLogin(LoginRequest request) async {
    print('Fecth Login ');
    emit(LoginIsLoading());
    final response = await repository.submitLogin(request);

    if (response is ResultSuccess) {
      emit(
        LoginSucces(data: (response as ResultSuccess).data),
      );
      final data = (state as LoginSucces).data;
      Commons().setUid(data.token.toString());
    } else {
      emit(LoginIsError(message: (response as ResultError).message));
    }
  }
}
