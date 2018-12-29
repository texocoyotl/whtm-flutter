import '../models/session_model.dart';

abstract class SessionEvent {}

class SessionInit extends SessionEvent{}

class SessionLogout extends SessionEvent{}

class SessionLogin extends SessionEvent{
  final SessionModel session;
  SessionLogin(this.session);
}
