import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'layanan_event.dart';
part 'layanan_state.dart';

class LayananBloc extends Bloc<LayananEvent, LayananState> {
  LayananBloc() : super(LayananInitial()) {
    on<LayananEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
