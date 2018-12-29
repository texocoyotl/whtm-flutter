import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:whtm/session/session_event.dart';
import 'package:whtm/session/session_state.dart';
import '../models/session_model.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState>{

  @override
  SessionState get initialState => SessionState.unauthorized();

  @override
  Stream<SessionState> mapEventToState(SessionState currentState,
      SessionEvent event) async* {

      if (event is SessionLogin){
        yield SessionState.sessionStart(event.session);
      }

      if (event is SessionLogout){
        yield SessionState.unauthorized();
      }
  }

  SessionModel get session => currentState.session;

}