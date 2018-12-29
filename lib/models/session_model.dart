import 'faction_model.dart';
import 'team_model.dart';

class SessionModel{

  final String token;
  final List<FactionModel> factions;
  final TeamModel team;

  const SessionModel({this.token, this.factions, this.team});

}

