import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget{
  final restaurant;
  
  ShopScreen({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
      ),
      body: Container(
        child: Text("${restaurant.id}"),
      ),
    );
  }
}