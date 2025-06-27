import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_management/presentation/state_management/account/account_event.dart';
import 'package:sales_management/presentation/state_management/account/account_state.dart';

class AccountBloc<BaseEvent, BaseState>
    extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial());
}
