import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/property_model.dart';

class PropertyRepository {
  final FirebaseFirestore firestore;

  PropertyRepository({required this.firestore});

  Future<List<Property>> getProperties() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('properties').get();

      return snapshot.docs
          .map((doc) => Property.fromFirestore(
                doc.data() as Map<String, dynamic>,
                doc.id,
              ))
          .toList();
    } catch (e) {
      throw Exception("Failed to load properties: $e");
    }
  }
}
