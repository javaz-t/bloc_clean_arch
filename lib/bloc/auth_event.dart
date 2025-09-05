part of 'auth_bloc.dart';

 abstract class AuthEvent {}

class LoginRequestEvent extends AuthEvent {
  final String emil;
  final String password;
  LoginRequestEvent(this.emil, this.password);
}

class LogoutRequestEvent extends AuthEvent {

}

