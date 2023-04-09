import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_change_state.dart';

class ProfileChangeCubit extends Cubit<ProfileChangeState> {
  ProfileChangeCubit() : super(ProfileChangeInitial());
}
