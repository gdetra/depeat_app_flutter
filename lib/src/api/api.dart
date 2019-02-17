import 'dart:convert';

import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:http/http.dart' show Client;

class Api{
  final String _BASE_URL = "http://138.68.86.70/";
  final String _RESTAURANTS_ENDPOINT = "restaurants/";
  Client client = Client();

  Future<List<Restaurant>> getRestaurants() async {
    List<Restaurant> list = [];
    var response = await client.get("$_BASE_URL$_RESTAURANTS_ENDPOINT");
    var result = json.decode(response.body);
    for(int i = 0; i<result.length; i++){
      list.add(new Restaurant.fromJson(result[i]));
    }
    return list;
  }

}