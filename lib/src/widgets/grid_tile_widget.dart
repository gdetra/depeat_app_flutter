import 'package:flutter/material.dart';

class GridTileRestaurant extends StatelessWidget{
  final restaurant;

  GridTileRestaurant({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Material(
        shadowColor: Colors.blue,
        child: InkWell(
          onTap: () {
            print('${restaurant.id}');
          },
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16.0),
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(restaurant.urlImage),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 20.0),
                ),
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