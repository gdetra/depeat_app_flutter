import 'package:depeat_flutter_app/src/blocs/shop_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/shop_provider.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:depeat_flutter_app/src/widgets/loading_widget.dart';
import 'package:depeat_flutter_app/src/widgets/restaurant_detail_widget.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget{
  final restaurant;
  
  ShopScreen({this.restaurant});

  @override
  Widget build(BuildContext context) {
    final bloc = ShopProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
      ),
      body: Column(
          children: <Widget>[
            buildRestaurantDetail(bloc),
            Divider(),
          ],
      ),
    );
  }

  Widget buildRestaurantDetail(ShopBloc bloc){
    return StreamBuilder(
      stream: bloc.restaurant,
      builder: (context, AsyncSnapshot<Restaurant> snapshot){
        if(!snapshot.hasData){
          return Loading();
        }

        return RestaurantDetail(restaurant: bloc.restaurantValue,);
      },
    );
  }
}