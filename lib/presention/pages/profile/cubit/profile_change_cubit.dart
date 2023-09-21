// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/token/token_data.dart';
import 'package:loginandsignup/domain/model/request/profile/profileRequest.dart';
import 'package:loginandsignup/domain/repository/changeProfile/change_profile_repository.dart';
part 'profile_change_state.dart';

class ProfileChangeCubit extends Cubit<ProfileChangeState> {
  final ChangeProfileRepository repository;
  ProfileChangeCubit(this.repository) : super(ProfileChangeInitial());

  Future<void> fetchChangeProfile(ProfileRequest request) async {
    final token = await Commons().getUid();
    print('ini token change profile = ${token}');
    emit(ProfileChangeIsLoading());
    final response = await repository.fetchChangeProfile(
        request, AuthenticationHeaderRequest(token!));

    print(response);
    if (response is ResultSuccess) {
      emit(
        ProfileChangeIsSuccess(data: (response as ResultSuccess).data),
      );
      var data = (state as ProfileChangeIsSuccess).data;
      await Commons().setUid(data.token.toString());
    } else {
      emit(ProfileChangeIsError(message: (response as ResultError).message));
      print((response).toString());
    }
  }
}
