import 'package:flutter/material.dart';
import 'package:sales_management/data/model/google_user_model.dart';

class StateManager extends ChangeNotifier {
  GoogleUserModel user = GoogleUserModel(
    uid: '0',
    name: 'Guest',
    email: '',
    phone: '',
    createdAt: DateTime.now(),
    lastLogin: DateTime.now(),
  );

  GoogleUserModel get getUser => user;

  void setUser(GoogleUserModel value) {
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
