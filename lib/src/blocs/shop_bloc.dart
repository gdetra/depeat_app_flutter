import 'package:depeat_flutter_app/src/api/api.dart';
import 'package:depeat_flutter_app/src/blocs/checkout_bloc.dart';
import 'package:depeat_flutter_app/src/models/order_model.dart';
import 'package:depeat_flutter_app/src/models/product_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:rxdart/rxdart.dart';

class ShopBloc {
  final _id = BehaviorSubject<String>();
  final _boughtProducts = BehaviorSubject<List<Product>>();
  final _products = BehaviorSubject<List<Product>>();
  final _restaurant = BehaviorSubject<Restaurant>();
  final _total = BehaviorSubject<double>();
  final _progress = BehaviorSubject<double>();
  final _enabledButton = BehaviorSubject<bool>();

  ShopBloc(){
    _progress.sink.add(0.0);
    _enabledButton.sink.add(false);
  }

  //Getters for stream

  Observable<List<Product>> get products => _products.stream;

  Observable<List<Product>> get boughtProducts => _boughtProducts.stream;

  Observable<Restaurant> get restaurant => _restaurant.stream;

  Observable<double> get total => _total.stream;
  Observable<double> get progress => _progress.stream;
  Observable<bool> get enabledButton => Observable.combineLatest2(total, progress, (t, p) => p >= 1.0 ? true : false);

  increaseQuantity(int index) {
    Product product = _products.value[index];
    product.increaseQuantity();
    double total = 0.0;
    _products.value.forEach((p) => total += (p.quantity * p.price));
    _progress.sink.add(total/_restaurant.value.minOrder);
    _total.sink.add(total);
    _products.sink.add(_products.value);
  }

  decreaseQuantity(int index) {
    Product product = _products.value[index];
    product.decreaseQuantity();
    double total = 0.0;
    _products.value.forEach((p) => total += (p.quantity * p.price));
    _progress.sink.add(total/_restaurant.value.minOrder);
    _total.sink.add(total);
    _products.sink.add(_products.value);
  }

  getListOfBoughtProducts() {
    List<Product> list = new List.from(_products.value);
    list.removeWhere((p) => p.quantity == 0);
    _boughtProducts.sink.add(list);
  }

  setId(String id){
    if(_id.value == null || id != _id.value){
      getRestaurantData(id);
    }
  }

  getRestaurantData(String restaurantId) async {
    Api api = Api();
    addRestaurant(null);
    _products.sink.add(null);
    addRestaurant(await api.getRestaurantById(restaurantId));
    addTotal(0.0);
    _products.sink.add(_restaurant.value.products);
  }

  addOrder(CheckoutBloc checkoutBloc){
    getListOfBoughtProducts();
    checkoutBloc.addRestaurant(_restaurant.value);
    checkoutBloc.addProducts(_boughtProducts.value);
    checkoutBloc.addTotal(_total.value);
  }

  //Getters for sink add function
  Function(List<Product>) get addBoughtProducts => _boughtProducts.sink.add;

  Function(Restaurant) get addRestaurant => _restaurant.sink.add;

  Function(double) get addTotal => _total.sink.add;

  Function(String) get addId => _id.sink.add;

  dispose() {
    _id.close();
    _progress.close();
    _enabledButton.close();
    _boughtProducts.close();
    _products.close();
    _restaurant.close();
    _total.close();
  }
}
