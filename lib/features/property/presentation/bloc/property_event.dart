part of 'property_bloc.dart';

class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object?> get props => [];
}

class LoadPropertyEvent extends PropertyEvent {
  @override
  List<Object?> get props => [];
}

class RemovePropertyEvent extends PropertyEvent {
  @override
  List<Object?> get props => [];
}

class ScrolledSliderPropertyEvent extends PropertyEvent {
  final Property property;
  final int index;

  const ScrolledSliderPropertyEvent(
      {required this.property, required this.index});

  @override
  List<Object?> get props => [property, index];
}
