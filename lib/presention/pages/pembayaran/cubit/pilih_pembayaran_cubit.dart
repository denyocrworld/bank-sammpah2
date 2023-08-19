import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pilih_pembayaran_state.dart';

class PilihPembayaranCubit extends Cubit<PilihPembayaranState> {
  PilihPembayaranCubit() : super(PilihPembayaranInitial());
}
