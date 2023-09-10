// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/domain/model/data/login/login_data.dart';
import '../../../../data/base/result_entity.dart';
import '../../../../data/utilities/commons.dart';
import '../../../../domain/base/authentication_header_request.dart';
import '../../../../domain/model/request/profile/profileRequest.dart';
import '../../../../domain/repository/changeProfile/change_profile_repository.dart';
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
        ProfileChangeIsSuccess(message: (response).data),
        
      );
      
    } else {
      emit(ProfileChangeIsError(message: (response as ResultError).message));
      print((response).message);
    }
  }
}
