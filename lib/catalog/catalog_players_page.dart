import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../session/session.dart';
import '../models/team_model.dart';
import 'army_dialog_wrapper.dart';

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

    List<PlayerModel> players =
        sessionBloc.session.team.players ?? List<PlayerModel>();

    return _content(players);

//});
  }

  Widget _content(List<PlayerModel> players) => ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
                decoration: BoxDecoration(color: Colors.white70),
                child: Column(children: <Widget>[
                  ListTile(
                    title: Text(
                      players[index].name,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return ArmyDialogWrapper(players[index].id, null);
                            },
                            fullscreenDialog: true));
                        //MaterialPageRoute(builder: (context) => ArmyDialogWrapper(players[index].id, null));
                      },
                      icon: Icon(Icons.playlist_add),
                    ),
                  ),
                  ArmyRows(players[index].id, players[index].armies),
                ])),
          );
        },
      );
}

class ArmyRows extends StatelessWidget {
  final String playerId;
  final List<ArmyModel> armies;

  ArmyRows(this.playerId, this.armies);

  @override
  Widget build(BuildContext context) => Column(
      children: armies
          ?.map((e) => _buildArmyButton(context, e.id, e.name))
          ?.toList());

  Widget _buildArmyButton(BuildContext context, String armyId, String label) =>
      RaisedButton(
          onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return ArmyDialogWrapper(playerId, armyId);
                  },
                  fullscreenDialog: true),
            );
          },
          child: ListTile(
            title: Text(label),
            trailing: Icon(Icons.list),
          ));
}
