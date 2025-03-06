import 'package:homzes/data/models/property_model.dart';

abstract class PropertyState {}

class PropertyLoading extends PropertyState {}

class PropertyLoaded extends PropertyState {
  final List<Property> properties;
  PropertyLoaded(this.properties);
}

class PropertyError extends PropertyState {
  final String message;
  PropertyError(this.message);
}
