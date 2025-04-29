import 'package:flutter/material.dart';
import 'package:sales_management/data/model/user.dart';

class StateManager extends ChangeNotifier {
  UserModel user = UserModel(
    uid: '0',
    name: 'Guest',
    email: '',
    phone: '',
    createdAt: DateTime.now(),
    lastLogin: DateTime.now(),
  );

  UserModel get getUser => user;

  void setUser(UserModel value) {
    user = value;
    notifyListeners();
  }

  // ~:Not Used:~
  // PageController carouselController = PageController(initialPage: 0);
  //
  // int currentCarouselIndex = 0;
  // int get getCurrentCarouselIndex => currentCarouselIndex;
  // void updateCarouselIndex(int index) {
  //   currentCarouselIndex = index;
  //   notifyListeners();
  // }
}
