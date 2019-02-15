import 'package:rxdart/rxdart.dart';
import 'validators.dart';

class LoginBloc with Validators{
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();

  //getters for email and password
  Observable<String> get email => _email.stream.transform(validateEmail);
  Observable<String> get password => _password.stream.transform(validatePassword);
  Observable<bool> get valid => Observable.combineLatest2(email, password, (e, p) => true);

  //Getters for sink email and password
  Function(String) get addEmail => _email.sink.add;
  Function(String) get addPassword => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
  }
}