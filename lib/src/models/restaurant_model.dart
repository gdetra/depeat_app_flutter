import 'package:depeat_flutter_app/src/models/product_model.dart';

class Restaurant {
  String _name;
  String _urlImage;
  String _address;
  double _minOrder;
  String _id;
  List<Product> _products;

  Restaurant.fromJson(Map<String, dynamic> parsedJson){
    _name = parsedJson["name"];
    _address = parsedJson["address"];
    if(parsedJson["image_url"].toString().contains("http://") || parsedJson["image_url"].toString().contains("https://")){
      _urlImage = parsedJson["image_url"];
    }else{
      _urlImage = "http://pngimage.net/wp-content/uploads/2018/06/image-not-found-png-4.png";
    }

    _minOrder = parsedJson["min_order"].toDouble();
    _id = parsedJson["id"];
    _products = [];
    for(int i = 0; i<parsedJson["products"].length; i++){
      _products.add(Product.fromJson(parsedJson["products"][i]));
    }
  }


  String get name => _name;

  String get urlImage => _urlImage;

  String get address => _address;

  double get minOrder => _minOrder;

  String get id => _id;

  List<Product> get products => _products;


}