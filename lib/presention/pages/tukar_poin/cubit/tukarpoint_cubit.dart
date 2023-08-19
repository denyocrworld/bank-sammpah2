import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/tukar_point/tukar_point_data.dart';
import 'package:loginandsignup/domain/repository/tukar_point/tukar_point_repository.dart';

part 'tukarpoint_state.dart';

class TukarpointCubit extends Cubit<TukarpointState> {
  final TukarPointRepository repository;
  TukarpointCubit(this.repository) : super(TukarpointInitial());

  Future<void> fecthTukarPoint() async {
    print("Fecth Tukar Point");
    emit(TukarpointIsLoading());
    final response = await repository
        .fecthTukarPoint(AuthenticationHeaderRequest("accesToken"));
    if (response is ResultSuccess) {
      emit(TukarpointIsSuccess((response as ResultSuccess).data));
    } else {
      emit(TukarpointIsError(message: (response as ResultError).message));
      print("Error");
    }
  }
}
