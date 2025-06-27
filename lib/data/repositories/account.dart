import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sales_management/data/model/google_user_model.dart';
import 'package:sales_management/domain/repositories/account.dart';

class AccountRepoImp implements AccountRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  @override
  Future<void> createAccount(GoogleUserModel user) async {
    try {
      // Create user with email and password
      final credential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.uid, // Using uid as password for now, you might want to change this
      );

      // Create user data in Firestore
      await _firestore.collection('users').doc(credential.user!.uid).set(user.toFirestore());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      throw Exception(e.message ?? 'An error occurred during account creation');
    } catch (e) {
      throw Exception('Failed to create account: $e');
    }
  }
}
