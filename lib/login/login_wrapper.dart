import 'package:flutter/material.dart';

class LoginWrapper extends StatelessWidget {
  final String title;
  final Widget _content;

  LoginWrapper(this.title, this._content);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _content,
      );
  }


}