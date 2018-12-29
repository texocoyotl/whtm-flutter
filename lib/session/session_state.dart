import '../models/session_model.dart';

class SessionState {

  final SessionModel session;

  const SessionState(this.session);

  factory SessionState.unauthorized(){
    return SessionState(null);
  }

  factory SessionState.sessionStart(SessionModel session){
    return SessionState(session);
  }
}