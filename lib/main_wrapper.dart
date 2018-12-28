import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  final String title;
  final Widget _content;

  MainWrapper(this.title, this._content);

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