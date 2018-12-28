import 'dart:async';
import 'package:bloc/bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{

  @override
  AuthState get initialState => AuthState.unauthorized();

  @override
  Stream<AuthState> mapEventToState(AuthState currentState,
      AuthEvent event) async* {

      if (event is AuthLoginSuccessful){
        yield AuthState.authorized(event.token);
      }
  }

  String get token{
    return currentState.token;
  }
}