import 'package:flutter/material.dart';

class RestaurantDetail extends StatelessWidget {
  final restaurant;

  RestaurantDetail({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(4.0),
      leading: CircleAvatar(
        radius: 35.0,
        backgroundImage: NetworkImage(restaurant.urlImage),
        backgroundColor: Colors.transparent,
      ),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.address),
    );
  }
}
