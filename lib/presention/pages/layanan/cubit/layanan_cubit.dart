// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/base/result_entity.dart';
import '../../../../data/utilities/commons.dart';
import '../../../../domain/base/authentication_header_request.dart';
import '../../../../domain/model/data/layanan/layananData.dart';
import '../../../../domain/repository/layanan/layanan_repository.dart';

part 'layanan_state.dart';

class LayananCubit extends Cubit<LayananState> {
  final LayananRepository repository;
  LayananCubit(this.repository) : super(LayananInitial());

  Future<void> fecthLayanan() async {
    emit(LayananIsLoading());
    final token = await Commons().getUid();
    print('Token Bank Sampah = ${token}');
    final response =
        await repository.fetchLayanan(AuthenticationHeaderRequest(token!));
    if (response is ResultSuccess) {
      emit(LayananIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(LayananIsError(message: (response as ResultError).message));
      print((response as ResultError).message);
    }
  }
}
