import 'package:equatable/equatable.dart';
import 'package:sales_management/presentation/state_management/base_state.dart';

abstract class AccountState extends BaseState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class AccountInitial extends AccountState {}
