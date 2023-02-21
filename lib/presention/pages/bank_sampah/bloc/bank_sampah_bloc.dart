import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bank_sampah_event.dart';
part 'bank_sampah_state.dart';

class BankSampahBloc extends Bloc<BankSampahEvent, BankSampahState> {
  BankSampahBloc() : super(BankSampahInitial()) {
    on<BankSampahEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
