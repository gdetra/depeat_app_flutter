import 'package:rxdart/rxdart.dart';
import 'package:depeat_flutter_app/src/blocs/login_bloc.dart';

class RegisterBloc extends LoginBloc{
  final _user = BehaviorSubject<String>();

  //Getters for stream
  Observable<String> get user => _user.stream.transform(validateUser);
  Observable<bool> get canRegister => Observable.combineLatest3(email, password, user, (e, p, s)=> true);

  // Getter for sink add function
  Function(String) get addUser => _user.sink.add;

  @override
  dispose() {
    _user.close();
  }

}