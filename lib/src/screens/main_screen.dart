import 'package:depeat_flutter_app/src/blocs/layout_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/layout_provider.dart';
import 'package:depeat_flutter_app/src/blocs/main_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/main_provider.dart';

import 'package:depeat_flutter_app/src/widgets/grid_widget.dart';
import 'package:depeat_flutter_app/src/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final layoutBloc = LayoutProvider.of(context);
    final mainBloc = MainProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("DepEat"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, "/LoginScreen");
              }),
          buildIcon(layoutBloc),
        ],
      ),
      body: buildList(layoutBloc, mainBloc),
    );
  }

  Widget buildIcon(LayoutBloc bloc) {
    return StreamBuilder(
      stream: bloc.isGrid,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return snapshot.data
            ? IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  bloc.addIsGrid(!snapshot.data);
                },
              )
            : IconButton(
                icon: Icon(Icons.grid_on),
                onPressed: () {
                  bloc.addIsGrid(!snapshot.data);
                },
              );
      },
    );
  }

  Widget buildList(LayoutBloc layoutBloc, MainBloc mainBloc) {
    return StreamBuilder(
      stream: layoutBloc.isGrid,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return snapshot.data ? GridRestaurant() : ListRestaurant();
      },
    );
  }

}
