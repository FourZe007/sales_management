abstract class BaseUserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final DateTime createdAt;
  final DateTime lastLogin;

  BaseUserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.lastLogin,
  });

  Map<String, dynamic> toFirestore();
}
