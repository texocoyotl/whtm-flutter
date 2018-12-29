import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whtm/session/session.dart';

import 'package:whtm/meta/meta_wrapper.dart';
import 'package:whtm/login/login_wrapper.dart';

import 'login/login_page.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final SessionBloc _authBloc = SessionBloc();

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionBloc>(
        bloc: _authBloc, child: MaterialApp(home: _content()));
  }

  Widget _content() {
    return BlocBuilder<SessionEvent, SessionState>(
        bloc: _authBloc,
        builder: (BuildContext context, SessionState state) {
          Widget content;

          if (state.session != null) {
            content = MetaWrapper(() => _authBloc.dispatch(SessionLogout()));
          } else {
            content = LoginWrapper('Login', LoginPage());
          }

          return content;
        });
  }
}
