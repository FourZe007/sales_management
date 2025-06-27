// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserModel {
//   String uid;
//   String name;
//   String email;
//   String phone;
//   DateTime createdAt;
//   DateTime lastLogin;

//   UserModel({
//     required this.uid,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.createdAt,
//     required this.lastLogin,
//   });

//   // factory UserModel.fromJson(Map<String, dynamic> json) {
//   //   return UserModel(
//   //     id: json['id'] as String,
//   //     name: json['name'] as String,
//   //     email: json['email'] as String,
//   //     phoneNumber: json['phone'] as String,
//   //   );
//   // }

//   // Factory method to create a User object from a Firestore document snapshot
//   factory UserModel.fromFirestore(
//     DocumentSnapshot<Map<String, dynamic>> snapshot,
//   ) {
//     final data = snapshot.data()!;
//     return UserModel(
//       uid: snapshot.id, // Use the document ID as the UID
//       email: data['email'] ?? '',
//       name: data['name'] ?? '',
//       phone: data['phone'] ?? '',
//       createdAt: (data['createdAt'] as Timestamp).toDate(),
//       lastLogin: (data['lastLogin'] as Timestamp).toDate(),
//     );
//   }

//   // Method to convert the User object back to a map for Firestore
//   Map<String, dynamic> toFirestore(User user) {
//     return {
//       'email': email,
//       'name': name,
//       'phone': phone,
//       'createdAt': FieldValue.serverTimestamp(),
//       'lastLogin': FieldValue.serverTimestamp(),
//     };
//   }
// }
