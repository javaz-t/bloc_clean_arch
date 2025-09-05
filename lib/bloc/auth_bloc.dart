import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequestEvent>(_logInRequested);
    on<LogoutRequestEvent>(_logOutRequested);
  }

  void _logOutRequested(
    LogoutRequestEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 2), () => emit(AuthInitial()));
    } catch (e) {
      emit(AuthFailure('$e'));
    }
  }

  void _logInRequested(LoginRequestEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      if (event.password.length < 6) {
        return emit(AuthFailure('password must be greater than 6 '));
      }
      await Future.delayed(
        Duration(seconds: 2),
        () => emit(AuthSuccess('${event.emil} - ${event.password}')),
      );
    } catch (e) {
      emit(AuthFailure('$e'));
    }
  }
}
