// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps,

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/data/utilities/commons.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/bank_sampah/bank_sampah_data.dart';
import 'package:loginandsignup/domain/model/data/layanan/layananData.dart';
import 'package:loginandsignup/domain/repository/layanan/layanan_repository.dart';

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

  /*
  incrementQty(int index) async {
    var data = (state as BankSampahIsSuccess).data;
    data.bank_sampah[index].qty++;
    emit(state.copyWith(
      data: data,
    ));
  }
  */

  incrementQty(int index) async {
    var data = (state as BankSampahIsSuccess).data;

    //ini bisa dihilangkan jika sudah pakai freezed X
    emit(BankSampahIsLoading());

    data.bank_sampah[index].qty++;
    emit(
      BankSampahIsSuccess(
        data: LayananData(
          data.bank_sampah,
          data.pick_up,
        ),
      ),
    );
    // emit(state.copyWith(
    //   data: data,
    // ));
    print("incrementQty");
  }

  decrementQty(int index) {
    var data = (state as BankSampahIsSuccess).data;
    emit(BankSampahIsLoading());

    data.bank_sampah[index].qty--;
    emit(BankSampahIsSuccess(
      data: LayananData(
        data.bank_sampah,
        data.pick_up,
      ),
    ));
    print("decrementQty");
  }

  double get total {
    if (state is! BankSampahIsSuccess) return 0;
    var data = (state as BankSampahIsSuccess).data;
    double itemTotal = 0.0;
    for (var item in data.bank_sampah) {
      itemTotal += item.qty * item.point;
    }
    return itemTotal;
  }
}
