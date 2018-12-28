

abstract class LoginEvent{}

class LoginGetTeams extends LoginEvent{}

class LoginAuthenticate extends LoginEvent{
  final String teamId;
  final String password;

  LoginAuthenticate(this.teamId, this.password);
}
