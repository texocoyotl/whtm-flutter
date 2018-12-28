import 'package:meta/meta.dart';

import "../models/team_model.dart";

class LoginState{
  final List<TeamModel> teams;
  final bool isLoading;
  final String error;
  final String token;

  const LoginState({
    @required this.teams,
    this.isLoading = false,
    this.error = '',
    this.token = '',
  });

  factory LoginState.loading(){
    return LoginState(
        teams: null, isLoading: true
    );
  }

  factory LoginState.withData(List<TeamModel> teams){
    return LoginState(
      teams: teams
    );
  }

  factory LoginState.withError(List<TeamModel> teams, String error){
    return LoginState(
        teams: teams, error: error
    );
  }

  factory LoginState.authenticated(String token){
    return LoginState(teams: null, token: token);
  }

}