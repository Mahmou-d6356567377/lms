part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpRequested(this.email, this.password);
}