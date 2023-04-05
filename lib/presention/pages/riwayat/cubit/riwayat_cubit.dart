import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/home/home_riwayat_data.dart';
import 'package:loginandsignup/domain/repository/history/history_repository.dart';

part 'riwayat_state.dart';

class RiwayatCubit extends Cubit<RiwayatState> {
  final HistoryRepository repository;
  RiwayatCubit(this.repository) : super(RiwayatInitial());

  Future<void> fecthHistory(header) async {
    print('Fecth Riwayat');
    emit(RiwayatIsLoading());
    final response = await repository
        .fecthHistory(AuthenticationHeaderRequest("accesToken"));
    if (response is ResultSuccess) {
      print("succes");
      emit(RiwayatIsSuccess((response as ResultSuccess).data));
    } else {
      print("Error");
      emit(RiwayatIsError(message: (response as ResultError).message!));
    }
  }
}
