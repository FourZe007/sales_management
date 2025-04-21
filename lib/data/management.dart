import 'package:flutter/material.dart';
import 'package:sales_management/model/user.dart';

class Management extends ChangeNotifier {
  UserModel user = UserModel(
    id: '0',
    name: 'Guest',
    email: '',
    phoneNumber: '',
  );
  UserModel get getUser => user;
  set setUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }
}
