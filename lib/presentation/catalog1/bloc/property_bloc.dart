import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/data/repository/property_repository.dart';
import 'property_event.dart';
import 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRepository repository;

  PropertyBloc({required this.repository}) : super(PropertyLoading()) {
    on<LoadProperties>((event, emit) async {
      try {
        final properties = await repository.getProperties();
        emit(PropertyLoaded(properties));
      } catch (e) {
        emit(PropertyError("Error loading properties"));
      }
    });
  }
}
