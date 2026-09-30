import 'package:cloud_firestore/cloud_firestore.dart';

/// Service class to handle Cloud Firestore operations
class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection reference for user profiles
  final String _collectionName = 'user_profiles';

  /// Save user data to Firestore as a new document
  Future<void> saveUserData(String name, int age, String hobby) async {
    try {
      // Add a new document with an auto-generated ID each time
      await _firestore.collection(_collectionName).add({
        'name': name,
        'age': age,
        'hobby': hobby,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to save data: $e');
    }
  }

  /// Get a real-time stream of all saved profiles
  Stream<QuerySnapshot> getAllUsersStream() {
    return _firestore
        .collection(_collectionName)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
