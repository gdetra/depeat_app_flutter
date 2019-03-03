import 'package:depeat_flutter_app/src/api/api.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc {
  final _restaurants = BehaviorSubject<Future<List<Restaurant>>>();

  MainBloc(){
    getRestaurants();
  }

  //Getter for stream
  Observable<Future<List<Restaurant>>> get restaurants => _restaurants.stream;

  getRestaurants() async {
    Api api = Api();
    addRestaurants(api.getRestaurants());
  }

  //Getters for sink add function
  Function(Future<List<Restaurant>>) get addRestaurants =>
      _restaurants.sink.add;

  dispose() {
    _restaurants.close();
  }
}
