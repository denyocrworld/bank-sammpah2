import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/model/data/registrasi/registrasi__data.dart';
import 'package:loginandsignup/domain/model/request/Register/register_request.dart';
import 'package:loginandsignup/domain/repository/registrasi/registrasi_repository.dart';

part 'registrasi_state.dart';

class RegistrasiCubit extends Cubit<RegistrasiState> {
  final RegistrasiRepository repository;
  RegistrasiCubit(this.repository) : super(RegistrasiInitial());

  Future<void> btnRegisteer(RegisterRequest request) async {
    print('Fecth Register');
    emit(RegistrasiIsLoading());
    final response = await repository.submitRegister(request);

    if (response is ResultSuccess) {
      emit(
        RegistrasiIsSucces(data: (response as ResultSuccess).data),
      );
      final data = (state as RegistrasiIsSucces).data;
      Commons().setUid(data.token.toString());
    } else {
      emit(RegistrasiIsError(message: (response as ResultError).message));
    }
  }
}
