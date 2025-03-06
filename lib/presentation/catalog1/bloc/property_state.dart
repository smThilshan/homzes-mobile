import 'package:homzes/data/models/property_model.dart';

// Abstract class representing different property states
abstract class PropertyState {}

// State when properties are being loaded
class PropertyLoading extends PropertyState {}

// State when properties are successfully loaded
class PropertyLoaded extends PropertyState {
  final List<Property> properties;
  PropertyLoaded(this.properties);
}

// State when there is an error loading properties
class PropertyError extends PropertyState {
  final String message;
  PropertyError(this.message);
}
