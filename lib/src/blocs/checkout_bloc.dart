import 'package:depeat_flutter_app/src/models/order_model.dart';
import 'package:depeat_flutter_app/src/models/product_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:rxdart/rxdart.dart';

class CheckoutBloc{
  final _restaurant = BehaviorSubject<Restaurant>();
  final _products = BehaviorSubject<List<Product>>();
  final _total = BehaviorSubject<double>();
  final _enabledButton = BehaviorSubject<bool>();

  Observable<Restaurant> get restaurant => _restaurant.stream;
  Observable<List<Product>> get products => _products.stream;
  Observable<double> get total => _total.stream;
  Observable<bool> get enabledButton => Observable.combineLatest2(total, restaurant, (t, r) => t >= r.minOrder);


  Function(Restaurant) get addRestaurant => _restaurant.sink.add;
  Function(List<Product>) get addProducts => _products.sink.add;
  Function(double) get addTotal => _total.sink.add;

  calculatePrice(int index){
    double total = 0.0;
    _products.value.removeAt(index);
    addProducts(_products.value);
    _products.value.forEach((p) => total += p.quantity * p.price);
    addTotal(total);
  }

  dispose(){
    _restaurant.close();
    _products.close();
    _total.close();
    _enabledButton.close();
  }
}