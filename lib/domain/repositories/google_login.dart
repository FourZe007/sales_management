import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleLoginRepo {
  Future<void> signInWithGoogle();
  Future<void> signOutWithGoogle();
  Future<void> saveGoogleCredentials(User? user);
  Future<void> getUserData();

  // Future<void> deleteUser();
  // Future<void> updateUser(String name, String email, String phone);
  // Future<String?> getCurrentUser();
  // Future<String?> getUserName();
  // Future<String?> getUserEmail();
  // Future<String?> getUserPhone();
}
