import 'package:depeat_flutter_app/src/blocs/layout_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/layout_provider.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LayoutProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("DepEat"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, "/LoginScreen");
              }),
          buildIcon(bloc),
        ],
      ),
      body: buildList(bloc),
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

  Widget buildList(LayoutBloc bloc) {
    return StreamBuilder(
      stream: bloc.isGrid,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return snapshot.data ? grid() : list();
      },
    );
  }

  Widget list() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, int index) {
        return buildTile(index);
      },
    );
  }

  Widget buildTile(int index) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(4.0),
        leading: CircleAvatar(
          radius: 35.0,
          backgroundImage: NetworkImage(
              "http://wallpaperbrowse.com/media/images/3848765-wallpaper-images-download.jpg"),
          backgroundColor: Colors.transparent,
        ),
        title: Text("Restaurant name"),
        subtitle: Text("Address"),
        onTap: () {
          print('$index');
        },
      ),
    );
  }

  Widget grid() {
    return GridView.builder(
        itemCount: 20,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return buildTileGrid(index);
        });
  }

  Widget buildTileGrid(int index) {
    return Card(
          elevation: 4.0,
          child: Material(
            shadowColor: Colors.blue,
            child: InkWell(
              onTap: (){
                print('$index');
              },
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          "http://wallpaperbrowse.com/media/images/3848765-wallpaper-images-download.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Restaurant name",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Address",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),

        );

  }
}
