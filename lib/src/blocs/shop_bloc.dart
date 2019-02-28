import 'package:depeat_flutter_app/src/api/api.dart';
import 'package:depeat_flutter_app/src/models/product_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:rxdart/rxdart.dart';

class ShopBloc{
  final _boughtProducts = BehaviorSubject<List<Product>>();
  final _products = BehaviorSubject<List<Product>>();
  final _restaurant = BehaviorSubject<Restaurant>();


  //Getters for stream
  Observable<List<Product>> get products => _products.stream;
  Observable<List<Product>> get boughtProducts => _boughtProducts.stream;
  Observable<Restaurant> get restaurant  => _restaurant.stream;

  getRestaurantData(String restaurantId) async {
    Api api = Api();
    addRestaurant(null);
    _products.sink.add(null);
    var restaurant = await api.getRestaurantById(restaurantId);
    addRestaurant(restaurant);
    print(_restaurant.value.products.toString());
    _products.sink.add(_restaurant.value.products);
  }


  //Getters for sink add function
  Function(List<Product>) get addBoughtProducts => _boughtProducts.sink.add;
  Function(Restaurant) get addRestaurant => _restaurant.sink.add;

  dispose(){
    _boughtProducts.close();
    _products.close();
    _restaurant.close();
  }
}