import 'package:depeat_flutter_app/src/api/api.dart';
import 'package:depeat_flutter_app/src/models/product_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:rxdart/rxdart.dart';

class ShopBloc{
  final _boughtProducts = BehaviorSubject<List<Product>>();
  final _products = BehaviorSubject<List<Product>>();
  final _restaurant = BehaviorSubject<Restaurant>();
  final _total = BehaviorSubject<double>();


  //Getters for stream
  Observable<List<Product>> get products => _products.stream;
  Observable<List<Product>> get boughtProducts => _boughtProducts.stream;
  Observable<Restaurant> get restaurant  => _restaurant.stream;
  Observable<double> get total => _total.stream;

  increaseQuantity(int index){
    Product product = _products.value[index];
    product.increaseQuantity();
    double total = 0.0;
    _products.value.forEach((p) => total += (p.quantity * p.price));
    _total.sink.add(total);
    _products.sink.add(_products.value);
  }

  decreaseQuantity(int index){
    Product product = _products.value[index];
    product.decreaseQuantity();
    double total = 0.0;
    _products.value.forEach((p) => total += (p.quantity * p.price));
    _total.sink.add(total);
    _products.sink.add(_products.value);
  }

  getListOfBoughtProducts(){
    List<Product> list = new List.from(_products.value);
    list.removeWhere((p) => p.quantity == 0);
    _boughtProducts.sink.add(list);
  }


  getRestaurantData(String restaurantId) async {
    Api api = Api();
    addRestaurant(null);
    _products.sink.add(null);
    var restaurant = await api.getRestaurantById(restaurantId);
    addRestaurant(restaurant);
    _products.sink.add(_restaurant.value.products);
  }


  //Getters for sink add function
  Function(List<Product>) get addBoughtProducts => _boughtProducts.sink.add;
  Function(Restaurant) get addRestaurant => _restaurant.sink.add;
  Function(double) get addTotal => _total.sink.add;

  dispose(){
    _boughtProducts.close();
    _products.close();
    _restaurant.close();
    _total.close();
  }
}