class CarouselState {
  final int currentIndex;

  const CarouselState({this.currentIndex = 0});

  factory CarouselState.initial() {
    return const CarouselState(currentIndex: 0); // Default to the first slide
  }

  CarouselState setNewIndex({int? newIndex}) {
    return CarouselState(currentIndex: newIndex ?? currentIndex);
  }
}
