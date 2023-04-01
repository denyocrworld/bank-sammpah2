import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/repository/config-code/config_code_repository.dart';
import 'package:loginandsignup/presention/pages/lupa_password/cubit/forgot_pass_cubit.dart';

part 'config_pass_state.dart';

class ConfigPassCubit extends Cubit<ConfigPassState> {
  ConfigCodeRepository repository;
  ConfigPassCubit(this.repository) : super(ConfigPassInitial());

  Future<void> sumbitConfigCode(String kode) async {
    emit(ConfigPassIsLoading());
    final response = await repository.submitConfigCode(kode);
    if (response is ResultSuccess) {
      if (response.data == null) {
        emit(ConfigPassIsSuccess(message: ""));
      }
    } else if (response is ResultError) {
      emit(ConfigPassIsError(message: response.message!));
    }
  }
}
