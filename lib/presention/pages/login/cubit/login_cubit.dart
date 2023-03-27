import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/model/data/login/login_data.dart';
import 'package:loginandsignup/domain/model/request/login/login_request.dart';

import 'package:loginandsignup/domain/repository/login/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;
  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> LoginUser(String? whatsappEmail, String? pass) async {
    print('Fecth Login ');
    emit(LoginIsLoading());
    final request = LoginRequest(whatsappEmail!, pass!);
    final response = await repository.submitLogin(request);
    if (response is ResultSuccess) {
      emit(LoginIsSuccess(
        data: (response as ResultSuccess).data,
      ));
      final token = (response as ResultSuccess).data;
      print(token);
    } else {
      emit(LoginIsError(message: (response as ResultError).message));
    }
  }
}
