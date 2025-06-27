import 'package:equatable/equatable.dart';
import 'package:sales_management/data/model/google_user_model.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
  
  @override
  List<Object?> get props => [];
}

class CreateAccount extends AccountEvent {
  final String email;
  final String password;
  final String? displayName;
  final String? phoneNumber;

  const CreateAccount({
    required this.email,
    required this.password,
    this.displayName,
    this.phoneNumber,
  }) : super();

  @override
  List<Object?> get props => [email, password, displayName, phoneNumber];
}

class LoginAccount extends AccountEvent {
  final String email;
  final String password;

  const LoginAccount({
    required this.email,
    required this.password,
  }) : super();

  @override
  List<Object?> get props => [email, password];
}

class AccountCreated extends AccountEvent {
  final GoogleUserModel user;

  const AccountCreated(this.user) : super();

  @override
  List<Object?> get props => [user];
}

class AccountLoggedIn extends AccountEvent {
  final GoogleUserModel user;

  const AccountLoggedIn(this.user) : super();

  @override
  List<Object?> get props => [user];
}

class AccountError extends AccountEvent {
  final String message;

  const AccountError(this.message) : super();

  @override
  List<Object?> get props => [message];
}
