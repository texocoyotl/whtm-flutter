import '../models/faction_model.dart';

class SessionState {

  final String token;
  final List<FactionModel> factions;

  const SessionState({this.token, this.factions});

  factory SessionState.unauthorized(){
    return SessionState(token: null);
  }

  factory SessionState.authorized(String token){
    return SessionState(token: token);
  }

  factory SessionState.dataFetched(String token, List<FactionModel> factions){
    return SessionState(token: token, factions: factions);
  }
}