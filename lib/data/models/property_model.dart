class Property {
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

  Property({
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

  factory Property.fromFirestore(Map<String, dynamic> data, String id) {
    return Property(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      price: data['price'] ?? 0,
      location: data['location'] ?? '',
      bed: data['bed'] ?? 0,
      bathroom: data['bathroom'] ?? 0,
      rating: (data['rating'] ?? 0.0).toDouble(),
      reviews: data['reviews'] ?? 0,
    );
  }
}
