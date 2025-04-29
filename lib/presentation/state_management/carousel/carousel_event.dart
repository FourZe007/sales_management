import 'package:sales_management/presentation/state_management/base_event.dart';

class CarouselEvent extends BaseEvent {
  final int newIndex;

  CarouselEvent({required this.newIndex});
}
