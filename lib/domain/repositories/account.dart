import 'package:sales_management/data/model/google_user_model.dart';

abstract class AccountRepo {
  Future<void> createAccount(GoogleUserModel user);
}
