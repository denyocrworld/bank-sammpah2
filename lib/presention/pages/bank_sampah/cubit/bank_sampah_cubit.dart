import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';

import '../../../../data/utilities/commons.dart';
import '../../../../domain/model/data/layanan/layananData.dart';
import '../../../../domain/repository/layanan/layanan_repository.dart';

part 'bank_sampah_state.dart';

class BankSampahCubit extends Cubit<BankSampahState> {
  final LayananRepository repository;
  BankSampahCubit(this.repository) : super(BankSampahInitial());

  Future<void> fecthBankSampah() async {
    emit(BankSampahIsLoading());
    final token = await Commons().getUid();
    print('Token Bank Sampah = ${token}');
    final response =
        await repository.fetchLayanan(AuthenticationHeaderRequest(token!));
    if (response is ResultSuccess) {
      emit(BankSampahIsSuccess(data: (response as ResultSuccess).data));
    } else {
      emit(BankSampahIsError(message: (response as ResultError).message));
      print((response as ResultError).message);
    }
  }
  // double calculatePrice(double weightInKilograms, String jenisLayanan) {
  //   final pickUpList = (state as BankSampahIsSuccess).data.pick_up;

  //   final layananData = pickUpList.firstWhere(
  //     (layanan) => layanan.layanan == jenisLayanan,
  //     orElse: () => PickUpData(layanan: '', price:  0, point: 0),
  //   );

  //     return layananData.price.toDouble();

  // }
}
