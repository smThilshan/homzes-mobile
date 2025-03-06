import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/data/repository/property_repository.dart';
import 'property_event.dart';
import 'property_state.dart';

// Bloc to manage property-related state
class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRepository repository;

  // Initializing Bloc with PropertyLoading state
  PropertyBloc({required this.repository}) : super(PropertyLoading()) {
    // Handling LoadProperties event
    on<LoadProperties>((event, emit) async {
      try {
        // Fetching property data from repository
        final properties = await repository.getProperties();
        emit(PropertyLoaded(properties)); // Emitting loaded state
      } catch (e) {
        emit(PropertyError("Error loading properties")); // Handling errors
      }
    });
  }
}
