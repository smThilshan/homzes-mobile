import 'package:homzes/data/repository/property_repository.dart';
import 'package:homzes/domain/entities/property_entity.dart';

class GetProperties {
  final PropertyRepository repository;

  GetProperties({required this.repository});

  Future<List<PropertyEntity>> call() async {
    final properties = await repository.getProperties();
    return properties
        .map((p) => PropertyEntity(
            id: p.id,
            title: p.title,
            description: p.description,
            image: p.image,
            price: p.price,
            location: p.location,
            bed: p.bed,
            bathroom: p.bathroom,
            rating: p.rating,
            reviews: p.reviews))
        .toList();
  }
}
