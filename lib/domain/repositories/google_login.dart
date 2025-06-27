import 'package:firebase_auth/firebase_auth.dart';
import 'package:sales_management/data/model/google_user_model.dart';

abstract class GoogleLoginRepo {
  Future<User?> signInWithGoogle();
  Future<void> signOutWithGoogle();
  Future<void> saveGoogleCredentials(User? user);
  Future<GoogleUserModel?> getUserData();

  // Future<void> deleteUser();
  // Future<void> updateUser(String name, String email, String phone);
  // Future<String?> getCurrentUser();
  // Future<String?> getUserName();
  // Future<String?> getUserEmail();
  // Future<String?> getUserPhone();
}
