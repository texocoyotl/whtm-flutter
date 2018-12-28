import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whtm/login/login.dart';
import '../models/team_model.dart';
import 'package:whtm/auth/auth.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }

}

class LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = LoginBloc();
  final _formKey = GlobalKey<FormState>();

  String _selectedTeamId;
  String _password;
  bool _snack_displayed = false;

  @override
  void initState() {
    _loginBloc.dispatch(LoginGetTeams());
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
        bloc: _loginBloc,
        builder: (BuildContext context, LoginState state) {
          Widget content;
          AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

          if (state.token.isNotEmpty){
            authBloc.dispatch(AuthLoginSuccessful(state.token));
            content = _loader();
          } else if (state.isLoading) {
            content = _loader();
          } else {
            if (state.error.isNotEmpty && !_snack_displayed) {
              _snack_displayed = true;
              _onWidgetDidBuild(() {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.error}'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              });
            }
            content = _form(getTeamMenuItems(state.teams));
          }

          return content;
        });
  }

  Widget _loader() => Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );

  Widget _form(List<DropdownMenuItem<String>> teamMenuItems) => Form(
      key: _formKey,
      child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  hintText: 'Select a team...',
                  labelText: 'Team',
                ),
                value: _selectedTeamId,
                items: teamMenuItems,
                onChanged: (String value){
                  setState(() {
                    _selectedTeamId = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please choose a valid team';
                  }
                },
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
              onSaved: (value) {
                _password = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _snack_displayed = false;
                    _loginBloc.dispatch(LoginAuthenticate(_selectedTeamId, _password));
                    print('Attempt login');
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ])));

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  List<DropdownMenuItem<String>> getTeamMenuItems(List<TeamModel> teams) {
    List<DropdownMenuItem<String>> items = new List();
    teams.forEach((team) => items
        .add(new DropdownMenuItem(value: team.id, child: new Text(team.name))));
    return items;
  }

}
