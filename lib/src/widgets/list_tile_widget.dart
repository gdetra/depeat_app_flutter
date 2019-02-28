import 'package:flutter/material.dart';

class ListTileRestaurant extends StatelessWidget{
  final restaurant;

  ListTileRestaurant({this.restaurant});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(4.0),
        leading: CircleAvatar(
          radius: 35.0,
          backgroundImage: NetworkImage(restaurant.urlImage),
          backgroundColor: Colors.transparent,
        ),
        title: Text(restaurant.name),
        subtitle: Text(restaurant.address),
        onTap: () {
          Navigator.pushNamed(context, "/ShopScreen", arguments: restaurant.id);
        },
      ),
    );
  }
}