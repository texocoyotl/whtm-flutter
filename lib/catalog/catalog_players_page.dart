import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../session/session.dart';

class CatalogPlayersPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CatalogPlayersPageState();
  }

}

class CatalogPlayersPageState extends State<CatalogPlayersPage> {

  @override
  Widget build(BuildContext context) {
//    return BlocBuilder<LoginEvent, LoginState>(
//    bloc: _loginBloc,
//    builder: (BuildContext context, LoginState state) {

//    Widget content;
    SessionBloc sessionBloc = BlocProvider.of<SessionBloc>(context);

    String text = sessionBloc.session.team.name + ' ' + sessionBloc.session.team.players.length.toString();
    return _content(text);

//});
  }

  Widget _content(String text) =>
      Center(
        child: Text(text),
      );

}
