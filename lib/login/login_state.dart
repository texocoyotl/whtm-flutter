import '../models/team_model.dart';
import '../models/session_model.dart';

class LoginState {
  final String loadingMessage;
  final String error;
  final bool isDataLoaded;

  final List<TeamModel> teams;
  final SessionModel session;

  const LoginState({
    this.loadingMessage = '',
    this.error = '',
    this.isDataLoaded = false,
    this.teams,
    this.session
  });

  factory LoginState.loading(String message) {
    return LoginState(loadingMessage: message);
  }

  factory LoginState.withData(List<TeamModel> teams) {
    return LoginState(teams: teams);
  }

  LoginState copyWith(
      {String loadingMessage,
      String error,
      bool isDataLoaded,
      List<TeamModel> teams,
      SessionModel session}) {
    return LoginState(
      loadingMessage: loadingMessage ?? this.loadingMessage,
      error: error ?? this.error,
      isDataLoaded: isDataLoaded ?? this.isDataLoaded,
      teams: teams ?? this.teams,
      session: session ?? this.session,
    );
  }

  @override
  String toString() {
    return 'LoginState: isDataLoaded $isDataLoaded, loadingMessage $loadingMessage, ' +
        'teams ${teams?.length}, session ${session == null ? 'no' : 'yes'}';
  }
}
