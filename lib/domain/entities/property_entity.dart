class PropertyEntity {
  final String id;
  final String title;
  final String description;
  final String image;
  final int price;
  final String location;
  final int bed;
  final int bathroom;
  final double rating;
  final int reviews;

  PropertyEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.location,
    required this.bed,
    required this.bathroom,
    required this.rating,
    required this.reviews,
  });
}
