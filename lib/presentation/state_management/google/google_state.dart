import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sales_management/presentation/state_management/base_state.dart';

abstract class GoogleState extends BaseState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class GoogleLoginInitial extends GoogleState {
  List<User> get getLoginInitial => [];
}

class GoogleLoginLoading extends GoogleState {
  List<User> get getLoginLoading => [];
}

class GoogleLoginSuccess extends GoogleState {
  final User userModel;

  GoogleLoginSuccess(this.userModel);

  User get getLoginSuccess => userModel;
}

class GoogleLoginFail extends GoogleState {
  final String errorMessage;

  GoogleLoginFail(this.errorMessage);

  String get getLoginFail => errorMessage;
}

class GoogleLoggedOut extends GoogleState {}
