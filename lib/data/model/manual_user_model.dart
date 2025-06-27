import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sales_management/data/model/base_user_model.dart';

class ManualUserModel extends BaseUserModel {
  final String password; // Note: This will be hashed by Firebase Auth

  ManualUserModel({
    required super.uid,
    required super.name,
    required super.email,
    required this.password,
    super.phone = '',
    DateTime? createdAt,
    DateTime? lastLogin,
  }) : super(
         createdAt: createdAt ?? DateTime.now(),
         lastLogin: lastLogin ?? DateTime.now(),
       );

  factory ManualUserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return ManualUserModel(
      uid: snapshot.id,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      password: '', // Password won't be stored in Firestore
      phone: data['phone'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      lastLogin: (data['lastLogin'] as Timestamp).toDate(),
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone,
      'authProvider': 'email_password',
      'createdAt': FieldValue.serverTimestamp(),
      'lastLogin': FieldValue.serverTimestamp(),
    };
  }
}
