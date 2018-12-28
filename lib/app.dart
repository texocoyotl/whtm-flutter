import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whtm/auth/auth.dart';

import 'main_wrapper.dart';
import 'meta/meta_page.dart';
import 'login/login_page.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final AuthBloc _authBloc = AuthBloc();

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        bloc: _authBloc, child: MaterialApp(home: _content()));
  }

  Widget _content() {
    return BlocBuilder<AuthEvent, AuthState>(
        bloc: _authBloc,
        builder: (BuildContext context, AuthState state) {
          Widget content;

          if (state.token != null) {
            content = MainWrapper('Meta Analysis', MetaPage());
          } else {
            content = MainWrapper('Login', LoginPage());
          }

          return content;
        });
  }
}
