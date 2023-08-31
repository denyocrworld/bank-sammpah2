import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';

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
