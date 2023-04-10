import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginandsignup/data/base/result_entity.dart';
import 'package:loginandsignup/domain/base/authentication_header_request.dart';
import 'package:loginandsignup/domain/model/data/bank_sampah/bank_sampah_data.dart';
import 'package:loginandsignup/domain/repository/bank_sampah/bank_sampah_repository.dart';

part 'bank_sampah_state.dart';

class BankSampahCubit extends Cubit<BankSampahState> {
  BankSampahRepository repository;
  BankSampahCubit(this.repository) : super(BankSampahInitial());

  Future<void> fecthBankSampah(header) async {
    emit(BankSampahIsLoading());
    final response = await repository
        .fecthBankSampah(AuthenticationHeaderRequest("accesToken"));
    if (response is ResultSuccess) {
      print("Success");
      emit(BankSampahIsSuccess((response as ResultSuccess).data));
    } else {
      print("error");
      emit(BankSampahIsError(message: (response as ResultError).message));
    }
  }
}
