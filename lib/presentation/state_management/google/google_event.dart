import 'package:sales_management/data/model/user.dart';
import 'package:sales_management/presentation/state_management/base_event.dart';

abstract class GoogleEvent extends BaseEvent {}

class ContinueWithGoogle extends GoogleEvent {
  String uid;
  String username;
  String email;
  String phone;
  DateTime? createdAt;
  DateTime? lastLogin;

  ContinueWithGoogle({
    this.uid = '',
    this.username = '',
    this.email = '',
    this.phone = '',
    this.createdAt,
    this.lastLogin,
  });

  UserModel get props => UserModel(
    uid: uid,
    name: username,
    email: email,
    phone: phone,
    createdAt: createdAt ?? DateTime.now(),
    lastLogin: lastLogin ?? DateTime.now(),
  );
}

class LogoutWithGoogle extends GoogleEvent {
  String uid;
  String username;
  String email;
  String phone;
  DateTime? createdAt;
  DateTime? lastLogin;

  LogoutWithGoogle({
    this.uid = '',
    this.username = '',
    this.email = '',
    this.phone = '',
    this.createdAt,
    this.lastLogin,
  });

  UserModel get props => UserModel(
    uid: uid,
    name: username,
    email: email,
    phone: phone,
    createdAt: createdAt ?? DateTime.now(),
    lastLogin: lastLogin ?? DateTime.now(),
  );
}
