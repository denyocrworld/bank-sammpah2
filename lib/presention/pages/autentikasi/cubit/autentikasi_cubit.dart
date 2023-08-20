import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/request/autentikasi_request/autentikasi_request.dart';
import 'package:loginandsignup/domain/repository/autentikasi/autentikasi_repository.dart';

part 'autentikasi_state.dart';

class AutentikasiCubit extends Cubit<AutentikasiState> {
  final AutentikasiRepository repository;
  AutentikasiCubit(this.repository) : super(AutentikasiInitial());

  Future<void> btnAutentikasi(Autentikasi requst) async {
    print('Fetch Autentikasi');
    emit(AutentikasiIsLoading());
    final response = await repository.autentikasi(requst);
    
    if (response is ResultSuccess) {
      if (response.data == null) {
        emit(
          AutentikasiIsSucess(message: 'Autentikasi Berhasi'),
        );
      } else {
        emit(AutentikasiIsSucess(message: (response as ResultSuccess).data));
        final token = (state as AutentikasiIsSucess).message;

        Commons().setUid(token.toString());
      }
    } else if (response is ResultError) {
      emit(AutentikasiIsError(message: 'Autentikasi Gagal'));
    }
  }
}
