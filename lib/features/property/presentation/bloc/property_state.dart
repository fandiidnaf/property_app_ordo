part of 'property_bloc.dart';
abstract class PropertyState {
  const PropertyState();
}

class PropertyInitial extends PropertyState {
  const PropertyInitial();
}
class PropertyLoading extends PropertyState {
  const PropertyLoading();
}
class PropertyLoaded extends PropertyState {
  const PropertyLoaded();
}
class PropertyError extends PropertyState {
  final Exception exception;
  const PropertyError(this.exception);
}

