import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/model/data/home/home_profile_data.dart';
import 'package:loginandsignup/domain/model/request/confirm_code_request/confirm_code.dart';
import 'package:loginandsignup/domain/repository/confrim_code/config_code_repository.dart';
import 'package:loginandsignup/presention/pages/lupa_password/cubit/forgot_pass_cubit.dart';

part 'config_pass_state.dart';

class ConfigPassCubit extends Cubit<ConfigPassState> {
  ConfigCodeRepository repository;
  ConfigPassCubit(this.repository) : super(ConfigPassInitial());

  Future<void> btnConfirmCode(ConfirmCodeRequest request) async {
    print('Fetch Confirm Code ');
    emit(ConfigPassIsLoading());
    final response = await repository.submitConfirmCode(request);
    final token = await Commons().getUid();
    print('Token : ${token}');

    if (response is ResultSuccess) {
      emit(
        ConfigPassIsSuccess(data: (response as ResultSuccess).data),
      );
      final data = (state as ConfigPassIsSuccess).data;
      Commons().setUid(data.email.toString());
    } else if (response is ResultError) {
      emit(ConfigPassIsError(message: (response as ResultError).message));
    }
  }
}
