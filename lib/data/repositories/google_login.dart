import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sales_management/core/constants/google.dart';
import 'package:sales_management/data/model/google_user_model.dart';
import 'package:sales_management/domain/repositories/google_login.dart';

class GoogleLoginRepoImp extends GoogleLoginRepo {
  @override
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser =
          await GoogleConstants.googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled the sign-in process

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await GoogleConstants.firebaseAuth
          .signInWithCredential(credential);

      // Return the signed-in user
      return userCredential.user;
    } catch (e) {
      debugPrint("Error during Google Sign-In: $e");
      return null;
    }
  }

  @override
  Future<void> signOutWithGoogle() async {
    await GoogleConstants.googleSignIn.signOut();
    await GoogleConstants.firebaseAuth.signOut();
  }

  @override
  Future<void> saveGoogleCredentials(User? user) async {
    if (user == null) {
      debugPrint("User is null. Cannot save credentials.");
      return;
    }

    // Reference to the Firestore collection
    final userCollection = FirebaseFirestore.instance.collection('user');

    // Check if the user already exists in Firestore
    final userDoc = await userCollection.doc(user.uid).get();
    if (!userDoc.exists) {
      // Save user credentials to Firestore
      await userCollection.doc(user.uid).set({
        'email': user.email,
        'name': user.displayName,
        'phone': user.phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
        'lastLogin': FieldValue.serverTimestamp(),
      });
    } else {
      // ~:User already exists in Firestore:~
      await userCollection.doc(user.uid).update({
        'email': user.email,
        'name': user.displayName,
        'phone': user.phoneNumber,
        'lastLogin': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  @override
  Future<GoogleUserModel?> getUserData() async {
    // Step 1: Get the current user from Firebase Authentication
    final firebaseUser = FirebaseAuth.instance.currentUser;

    // ~:No user is currently signed in:~
    if (firebaseUser == null) {
      return null;
    }

    // Step 2: Save the user credentials to Firestore
    await saveGoogleCredentials(firebaseUser);

    // Step 3: Fetch the user's additional data from Firestore
    final firestore = FirebaseFirestore.instance;
    final userDocRef = firestore.collection('user').doc(firebaseUser.uid);
    final userDoc = await userDocRef.get();

    if (userDoc.exists) {
      // Create a GoogleUserModel object from Firestore data
      return GoogleUserModel.fromFirestore(userDoc);
    } else {
      // ~:User data not found in Firestore:~
      return null;
    }
  }
}
