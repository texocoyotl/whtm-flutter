import 'dart:async';
import 'package:bloc/bloc.dart';

import "login_event.dart";
import "login_state.dart";
import "../models/team_model.dart";
import '../models/login_model.dart';
import '../models/faction_model.dart';
import '../models/session_model.dart';
import "package:whtm/api_provider.dart";
import 'package:whtm/api_exception.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final ApiProvider apiProvider = ApiProvider();
  List<TeamModel> _teams;
  List<FactionModel> _factions;

  @override
  LoginState get initialState => LoginState.loading('Loading Teams...');

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
      yield currentState.copyWith(loadingMessage: 'Authenticating...');

      try {
        LoginModel login = await apiProvider.authenticate(
            event.teamId, event.password);

        if (login.token == null || login.token.isEmpty) {
          yield currentState.copyWith(loadingMessage: '', error: login.message);
        } else {
          yield currentState.copyWith(loadingMessage: 'Loading Factions...');

          _factions = _factions ?? await apiProvider.fetchFactions(login.token);

          yield currentState.copyWith(loadingMessage: 'Loading Team Data...');

          TeamModel team = await apiProvider.fetchTeam(login.token, event.teamId);

          SessionModel session = SessionModel(token: login.token, factions: _factions, team: team);

          yield currentState.copyWith(isDataLoaded: true, loadingMessage: 'Loading Complete', session: session);
        }
      } on ApiException catch(e){
        yield currentState.copyWith(loadingMessage: '', error: e.message);
      } on Exception catch(e){
        yield currentState.copyWith(loadingMessage: '', error: e.toString());
      }
    }
  }
}

