
class AuthState {

  final String token;

  const AuthState(this.token);

  factory AuthState.unauthorized(){
    return AuthState(null);
  }

  factory AuthState.authorized(String token){
    return AuthState(token);
  }
}