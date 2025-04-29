import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_management/data/repositories/google_login.dart';
import 'package:sales_management/presentation/state_management/google/google_event.dart';
import 'package:sales_management/presentation/state_management/google/google_state.dart';

class GoogleBloc<BaseEvent, BaseState> extends Bloc<GoogleEvent, GoogleState> {
  GoogleBloc() : super(GoogleLoginInitial()) {
    on<ContinueWithGoogle>(loginWithGoogle);
    on<LogoutWithGoogle>(logoutWithGoogle);
  }

  Future<void> loginWithGoogle(
    ContinueWithGoogle event,
    Emitter<GoogleState> emit,
  ) async {
    emit(GoogleLoginLoading());
    try {
      // Simulate a network call or any async operation
      User? res = await GoogleLoginRepoImp().signInWithGoogle();

      if (res != null) {
        // Save user credentials to Firestore
        await GoogleLoginRepoImp().saveGoogleCredentials(res);
        emit(GoogleLoginSuccess(res));
      } else {
        emit(GoogleLoginFail("Login failed"));
      }
    } catch (e) {
      emit(GoogleLoginFail(e.toString()));
    }
  }

  Future<void> logoutWithGoogle(
    LogoutWithGoogle event,
    Emitter<GoogleState> emit,
  ) async {
    emit(GoogleLoginLoading());
    try {
      // Simulate a network call or any async operation
      await GoogleLoginRepoImp().signOutWithGoogle();
      emit(GoogleLoggedOut());
    } catch (e) {
      emit(GoogleLoginFail(e.toString()));
    }
  }
}
