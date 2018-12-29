import '../models/faction_model.dart';

abstract class SessionEvent {}

class SessionInit extends SessionEvent{}

class SessionLogout extends SessionEvent{}

class SessionLogin extends SessionEvent{
  final String token;
  SessionLogin(this.token);
}

class SessionFactionsLoaded extends SessionEvent{
  final List<FactionModel> factions;
  SessionFactionsLoaded(this.factions);
}