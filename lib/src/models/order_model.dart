import 'package:depeat_flutter_app/src/models/product_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';

class Order{
  Restaurant _restaurant;
  List<Product> _products;
  double _total;

  Order(this._restaurant, this._products, this._total);

  double get total => _total;

  set total(double value) {
    _total = value;
  }

  List<Product> get products => _products;

  set products(List<Product> value) {
    _products = value;
  }

  Restaurant get restaurant => _restaurant;

  set restaurant(Restaurant value) {
    _restaurant = value;
  }


}