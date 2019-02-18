import 'package:depeat_flutter_app/src/blocs/shop_provider.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
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
      body: StreamBuilder(
        stream: bloc.restaurant,
        builder: (context, AsyncSnapshot<Restaurant> snapshot){
          if(!snapshot.hasData){
            return Text("I'm getting the id");
          }

          return Text(snapshot.data.id);
        },
      )
    );
  }
}