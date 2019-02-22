import 'dart:convert';
import 'package:depeat_flutter_app/src/models/error_model.dart';
import 'package:depeat_flutter_app/src/models/login_model.dart';
import 'package:depeat_flutter_app/src/models/register_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:http/http.dart' show Client;

class Api {
  final String _BASE_URL = "http://138.68.86.70/";
  final String _RESTAURANTS_ENDPOINT = "restaurants/";
  Client client = Client();

  Future<List<Restaurant>> getRestaurants() async {
    List<Restaurant> list = [];
    var response = await client.get("$_BASE_URL$_RESTAURANTS_ENDPOINT");
    var result = json.decode(response.body);
    for (int i = 0; i < result.length; i++) {
      list.add(new Restaurant.fromJson(result[i]));
    }
    return list;
  }

  Future<Restaurant> getRestaurantById(String id) async {
    var response = await client.get("$_BASE_URL$_RESTAURANTS_ENDPOINT$id");
    return Restaurant.fromJson(json.decode(response.body));
  }

  Future<dynamic> doLogin(String indentifier, String password) async {
    var response = await client.post(
      "$_BASE_URL${LoginModel.ENDPOINT}",
      body: {"identifier": indentifier, "password": password},
    );
    if(response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    }else{
      return ErrorModel.fromJson(json.decode(response.body));
    }
  }

  Future<dynamic> doRegister(
      String email, String password, String username) async{
    var response = await client.post(
      "$_BASE_URL${RegisterModel.ENDPOINT}",
      body: {"username": username, "password": password, "email": email},
    );
    if(response.statusCode == 200){
      return RegisterModel.fromJson(json.decode(response.body));
    }else{
      return ErrorModel.fromJson(json.decode(response.body));
    }

  }
}
