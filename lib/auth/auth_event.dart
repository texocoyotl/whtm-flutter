

abstract class AuthEvent {}

class AuthInit extends AuthEvent{}

class AuthLoginSuccessful extends AuthEvent{
  final String token;

  AuthLoginSuccessful(this.token);
}