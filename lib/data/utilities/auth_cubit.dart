// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'commons.dart';

enum AuthState { isLoading, authenticated, unauthenticated, tokenExpired }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.unauthenticated);

  Future<void> checkToken() async {
    emit(AuthState.isLoading);
    final token = await Commons().getUid();

    if (validationToken(token)) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode('$token');

      int timestampInSeconds = decodedToken["exp"];
      int timestampInMilliseconds = timestampInSeconds * 1000;
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        timestampInMilliseconds,
      );

      if (validationExp(dateTime)) {
        emit(AuthState.authenticated);
      } else {
        emit(AuthState.tokenExpired);
      }
    } else {
      emit(AuthState.unauthenticated);
    }
  }

  Future<void> logOut() async {
    await Commons().removeUid();
    emit(AuthState.unauthenticated);
  }
}

validationToken(token) {
  if (token != null && token != '') {
    return true;
  } else {
    return false;
  }
}

validationExp(dateTime) {
  print('DATE TIME NOW : ${DateTime.now()}');
  print('TOKEN EXP: ${dateTime}');
  if (dateTime.isAfter(DateTime.now())) {
    print('Validation Exp : ${true}');
    return true;
  } else {
    print('Validation Exp : ${false}');
    return false;
  }
}
