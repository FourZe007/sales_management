import 'package:sales_management/presentation/state_management/carousel/carousel_event.dart';
import 'package:sales_management/presentation/state_management/carousel/carousel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselState.initial()) {
    on<CarouselEvent>((event, emit) {
      // Emit a new state with the updated index
      emit(state.setNewIndex(newIndex: event.newIndex));
    });
  }
}
