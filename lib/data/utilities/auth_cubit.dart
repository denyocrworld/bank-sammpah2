// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, unnecessary_null_comparison

import 'package:flutter_bloc/flutter_bloc.dart';

import 'commons.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(true);

  Future<bool> checkToken() async {
    final token = await Commons().getUid();
    print('TOKEN Auth: ${token}');
    if (token != null && token != '') {
      return true;
    } else {
      return false;
      // emit(false);
    }
  }

  void logout() async {
    await Commons().removeUid();
  }
}
