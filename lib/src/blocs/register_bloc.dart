import 'package:depeat_flutter_app/src/models/register_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:depeat_flutter_app/src/blocs/login_bloc.dart';

class RegisterBloc extends LoginBloc{
  final _user = BehaviorSubject<String>();
  final _register = BehaviorSubject<RegisterModel>();

  //getter for values
  String get userValue => _user.value;

  //Getters for stream
  Observable<String> get user => _user.stream.transform(validateUser);
  Observable<bool> get canRegister => Observable.combineLatest3(email, password, user, (e, p, s)=> true);
  Observable<RegisterModel> get register => _register.stream;

  // Getter for sink add function
  Function(String) get addUser => _user.sink.add;
  Function(RegisterModel) get addRegister => _register.sink.add;

  @override
  dispose() {
    _user.close();
    _register.close();
  }

}