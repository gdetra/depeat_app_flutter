import 'package:depeat_flutter_app/src/blocs/main_provider.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:depeat_flutter_app/src/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';

class ListRestaurant extends StatelessWidget{

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
            return ListView.builder(
              itemCount: listSnapshot.data.length,
              itemBuilder: (context, int index) {
                return ListTileRestaurant(restaurant: listSnapshot.data[index]);
              },
            );
          },
        );
      },
    );
  }
}