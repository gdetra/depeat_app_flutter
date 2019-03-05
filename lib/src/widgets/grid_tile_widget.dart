import 'package:depeat_flutter_app/src/blocs/shop_provider.dart';
import 'package:flutter/material.dart';

class GridTileRestaurant extends StatelessWidget {
  final restaurant;

  GridTileRestaurant({this.restaurant});

  @override
  Widget build(BuildContext context) {
    final bloc = ShopProvider.of(context);

    return Card(
        elevation: 4.0,
        child: Material(
          shadowColor: Colors.blue,
          child: InkWell(
            onTap: () {
              bloc.setId(restaurant.id);
              Navigator.pushNamed(context, "/ShopScreen");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(restaurant.urlImage),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                 Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 20.0),
                  ),

                Container(
                  child: Text(
                    restaurant.address,
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
