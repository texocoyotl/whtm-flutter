import 'dart:async';
import 'package:bloc/bloc.dart';

import "login_event.dart";
import "login_state.dart";
import "../models/team_model.dart";
import '../models/login_model.dart';
import "package:whtm/api_provider.dart";
import 'package:whtm/api_exception.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final ApiProvider apiProvider = ApiProvider();
  List<TeamModel> _teams;

  @override
  LoginState get initialState => LoginState.loading();

  @override
  void dispose() {
    apiProvider.close();
    super.dispose();
  }

  @override
  Stream<LoginState> mapEventToState(LoginState currentState,
      LoginEvent event) async* {
    if (event is LoginGetTeams) {

      if (_teams == null) {
        _teams = await apiProvider.fetchTeams();
      }

      yield LoginState.withData(_teams);
    }

    if (event is LoginAuthenticate){
      yield LoginState.loading();

      try {
        LoginModel login = await apiProvider.authenticate(
            event.teamId, event.password);

        if (login.token == null || login.token.isEmpty) {
          yield LoginState.withError(currentState.teams, login.message);
        } else {
          yield LoginState.authenticated(login.token);
        }
      } on ApiException catch(e){
        yield LoginState.withError(currentState.teams, e.message);
      }
    }
  }
}

