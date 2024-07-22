import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/property.dart';
import '../../domain/use_cases/property_use_case.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyUseCase propertyUseCase;

  PropertyBloc({required this.propertyUseCase})
      : super(const PropertyInitial()) {
    on<LoadPropertyEvent>(_loadProperty);
    on<RemovePropertyEvent>(_removeProperty);
    on<ScrolledSliderPropertyEvent>(_scrolledSlider);
  }

  Future<void> _loadProperty(
    LoadPropertyEvent event,
    Emitter<PropertyState> emit,
  ) async {
    emit(const PropertyLoading());
    final result = await propertyUseCase.call();
    result.fold(
      (exception) => emit(PropertyError(exception)),
      (property) => emit(PropertyLoaded(property)),
    );
  }

  Future<void> _removeProperty(
      RemovePropertyEvent event, Emitter<PropertyState> emit) async {
    emit(const PropertyInitial());
  }

  Future<void> _scrolledSlider(
      ScrolledSliderPropertyEvent event, Emitter<PropertyState> emit) async {
    emit(PropertyLoaded(event.property, event.index));
  }
}
