import 'package:flutter/material.dart';

class ArmyDialogWrapper extends StatelessWidget {
  final String playerId;
  final String armyId;

  ArmyDialogWrapper(this.playerId, this.armyId);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('New Army List'),
      actions: <Widget>[
        FlatButton(
          child: Text('Save', style: TextStyle(color: Colors.white),),
          onPressed: () {}
        ),
      ]),
      body: Center(
        child: Text('$playerId $armyId'),
      ),
    );
  }
}
