// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/base/authentication_header_request.dart';
import '../../../../domain/model/data/token/token_data.dart';
import '../../../../domain/repository/token/token_repository.dart';
import '../../../base/result_entity.dart';
import '../../commons.dart';

part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  final TokenRepository repository;
  TokenCubit(this.repository) : super(TokenInitial());

  Future<void> fecthRefreshToken() async {
    emit(TokenIsLoading());
    var token = await Commons().getUid();
    print('Token Lama = ${token}');
    final response =
        await repository.fetchRefreshToken(AuthenticationHeaderRequest(token!));
    if (response is ResultSuccess) {
      emit(TokenIsSucces(data: (response as ResultSuccess).data));
      var data = (response as ResultSuccess).data;
      await Commons().setUid(data);

      print("ini token baru : ${(response as ResultSuccess).data}");
    } else {
      emit(TokenIsError(message: (response as ResultError).message.toString()));
      print((response as ResultError).message);
    }
  }
}
