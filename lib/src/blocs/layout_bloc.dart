import 'package:rxdart/rxdart.dart';

class LayoutBloc{
  final _isGridLayoutSelected = new BehaviorSubject<bool>();

  LayoutBloc(){
    addIsGrid(false);
  }

  //Getter for stream
  Observable<bool> get isGrid => _isGridLayoutSelected.stream;

  //Getter for sink function
  Function(bool) get addIsGrid => _isGridLayoutSelected.sink.add;

  dispose(){
    _isGridLayoutSelected.close();
  }
}