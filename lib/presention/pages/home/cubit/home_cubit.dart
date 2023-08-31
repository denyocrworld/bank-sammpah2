// ignore_for_file: avoid_print, depend_on_referenced_packages, unnecessary_brace_in_string_interps

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/home/home_data.dart';
import 'package:loginandsignup/domain/repository/home/home.repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;
  HomeCubit(this.repository) : super(const HomeState());

  var logger = Logger(
    printer: PrettyPrinter(),
  );
  Future<void> fecthHome() async {
    emit(HomeIsLoading());
    final token = await Commons().getUid();
    print('Token Home = $token');
    final response =
        await repository.fecthHome(AuthenticationHeaderRequest(token!));

    logger.i(response);

    if (response is ResultSuccess) {
      emit(HomeIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(HomeIsError(message: (response as ResultError).message));
      print("error cubit : ${(response as ResultError).message}");
    }
  }
}
