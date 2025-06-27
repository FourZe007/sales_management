import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sales_management/data/model/base_user_model.dart';

class GoogleUserModel extends BaseUserModel {
  final String? photoUrl;
  final String? providerId;

  GoogleUserModel({
    required super.uid,
    required super.name,
    required super.email,
    super.phone = '',
    DateTime? createdAt,
    DateTime? lastLogin,
    this.photoUrl,
    this.providerId,
  }) : super(
         createdAt: createdAt ?? DateTime.now(),
         lastLogin: lastLogin ?? DateTime.now(),
       );

  factory GoogleUserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return GoogleUserModel(
      uid: snapshot.id,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      photoUrl: data['photoUrl'],
      providerId: data['providerId'],
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
      'photoUrl': photoUrl,
      'providerId': providerId,
      'authProvider': 'google',
      'createdAt': FieldValue.serverTimestamp(),
      'lastLogin': FieldValue.serverTimestamp(),
    };
  }
}
