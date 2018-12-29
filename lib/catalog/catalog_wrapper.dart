import 'package:flutter/material.dart';
import 'catalog_players_page.dart';
import 'catalog_armies_page.dart';

class CatalogWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Catalogs'),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.perm_identity), text: 'Player Lists'),
              Tab(icon: Icon(Icons.list), text: 'Meta Lists'),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              CatalogPlayersPage(),
              CatalogArmiesPage(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: null,
              elevation: 20,
              child: Icon(Icons.add),
          ),
        ));
  }
}
