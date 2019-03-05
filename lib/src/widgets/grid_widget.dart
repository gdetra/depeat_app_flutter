import 'package:depeat_flutter_app/src/blocs/main_provider.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:depeat_flutter_app/src/widgets/grid_tile_widget.dart';
import 'package:depeat_flutter_app/src/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class GridRestaurant extends StatelessWidget{
  final int gridNum;

  GridRestaurant({this.gridNum});

  @override
  Widget build(BuildContext context) {
    final bloc = MainProvider.of(context);

    return StreamBuilder(
        stream: bloc.restaurants,
        builder: (context, AsyncSnapshot<Future<List<Restaurant>>> snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          }

          return FutureBuilder(
              future: snapshot.data,
              builder: (context, AsyncSnapshot<List<Restaurant>> listSnapshot) {
                if (!listSnapshot.hasData) {
                  return Loading();
                }
                return GridView.builder(
                    itemCount: listSnapshot.data.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridNum,childAspectRatio: 0.8),
                    itemBuilder: (BuildContext context, int index) {
                      return GridTileRestaurant(restaurant: listSnapshot.data[index]);
                    });
              });
        });
  }
}