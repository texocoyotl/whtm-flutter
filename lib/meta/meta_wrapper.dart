import 'package:flutter/material.dart';

import '../catalog/catalog_wrapper.dart';
import '../meta/meta_analysis_page.dart';
import '../meta/meta_details_page.dart';

class MetaWrapper extends StatelessWidget {

  final Function logoutCallback;

  MetaWrapper(this.logoutCallback);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meta Analysis'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.storage),
                tooltip: 'Air it',
                onPressed: () =>  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CatalogWrapper()),
                ),
              ),
              IconButton(
                icon: Icon(Icons.exit_to_app),
                tooltip: 'Restitch it',
                onPressed: logoutCallback,
              ),
            ],
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              MetaAnalysisPage(),
              MetaDetailsPage()
            ],
          ),
        ));
  }
}
