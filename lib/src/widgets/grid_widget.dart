import 'package:depeat_flutter_app/src/blocs/main_provider.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:depeat_flutter_app/src/widgets/grid_tile_widget.dart';
import 'package:flutter/material.dart';

class GridRestaurant extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = MainProvider.of(context);

    return StreamBuilder(
        stream: bloc.restaurants,
        builder: (context, AsyncSnapshot<Future<List<Restaurant>>> snapshot) {
          if (!snapshot.hasData) {
            return Text('waiting for Data');
          }

          return FutureBuilder(
              future: snapshot.data,
              builder: (context, AsyncSnapshot<List<Restaurant>> listSnapshot) {
                if (!listSnapshot.hasData) {
                  return Text('waiting for Data..');
                }
                return GridView.builder(
                    itemCount: listSnapshot.data.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return GridTileRestaurant(restaurant: listSnapshot.data[index]);
                    });
              });
        });
  }
}