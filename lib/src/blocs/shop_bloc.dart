import 'package:depeat_flutter_app/src/models/product_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:rxdart/rxdart.dart';

class ShopBloc{
  final _products = PublishSubject<List<Product>>();
  final _restaurant = BehaviorSubject<Future<Restaurant>>();

  //Getters for stream
  Observable<List<Product>> get products => _products.stream;
  Observable<Future<Restaurant>> get restaurant  => _restaurant.stream;


  //Getters for sink add function
  Function(List<Product>) get addProducts => _products.sink.add;
  Function(Future<Restaurant>) get addRestaurant => _restaurant.sink.add;

  dispose(){
    _products.close();
    _restaurant.close();
  }
}