import 'package:firebase_auth/firebase_auth.dart';

/// Service class to handle Firebase Authentication operations
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sign in with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      // Authenticate user with Firebase
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      // Return null or throw exception if login fails
      return null;
    }
  }

  /// Sign up a new user with email and password
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      // Create a new user in Firebase Auth
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      // Return null if registration fails
      return null;
    }
  }

  /// Sign out the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Get the current logged in user
  User? get currentUser => _auth.currentUser;
}
