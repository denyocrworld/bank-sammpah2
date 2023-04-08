import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'penjemputan_event.dart';
part 'penjemputan_state.dart';

class PenjemputanBloc extends Bloc<PenjemputanEvent, PenjemputanState> {
  PenjemputanBloc() : super(PenjemputanInitial()) {
    on<PenjemputanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
