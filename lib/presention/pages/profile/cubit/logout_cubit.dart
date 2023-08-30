import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/utilities/commons.dart';

import '../../../../data/base/result_entity.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  Future<void> fetchLogout() async {
    final response = Commons().removeUid();
    if (response is ResultSuccess) {
      emit(
        LogoutIsSucces(message: (response as ResultSuccess).data),
      );
    } else if (response is ResultError) {
      emit(LogoutIsError(message: (response as ResultError).message));
    }
  }
}
