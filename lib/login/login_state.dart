import "../models/team_model.dart";
import '../models/faction_model.dart';

class LoginState {
  final String loadingMessage;
  final String error;
  final String token;
  final bool isDataLoaded;

  final List<TeamModel> teams;
  final List<FactionModel> factions;

  const LoginState({
    this.loadingMessage = '',
    this.error = '',
    this.token = '',
    this.isDataLoaded = false,
    this.teams,
    this.factions,
  });

  factory LoginState.loading(String message) {
    return LoginState(loadingMessage: message);
  }

  factory LoginState.withData(List<TeamModel> teams) {
    return LoginState(teams: teams);
  }

  factory LoginState.withError(String error) {
    return LoginState(error: error);
  }

  factory LoginState.authenticated(String token) {
    return LoginState(token: token);
  }

  LoginState copyWith(
      {String loadingMessage,
      String error,
      String token,
      bool isDataLoaded,
      List<TeamModel> teams,
      List<FactionModel> factions}) {
    return LoginState(
      loadingMessage: loadingMessage ?? this.loadingMessage,
      error: error ?? this.error,
      token: token ?? this.token,
      isDataLoaded: isDataLoaded ?? this.isDataLoaded,
      teams: teams ?? this.teams,
      factions: factions ?? this.factions,
    );
  }

  @override
  String toString() {
    return 'LoginState: isDataLoaded $isDataLoaded, loadingMessage $loadingMessage, ' +
        'token ${token.length}, teams ${teams?.length}, factions ${factions?.length}';
  }
}
