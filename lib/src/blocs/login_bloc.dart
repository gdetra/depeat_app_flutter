import 'package:depeat_flutter_app/src/models/login_model.dart';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';

class LoginBloc with Validators{
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();
  final _login = new BehaviorSubject<Future<LoginModel>>();

  //getters for value
  String get emailValue => _email.value;
  String get passwordValue => _password.value;

  //getters for email and password
  Observable<String> get email => _email.stream.transform(validateEmail);
  Observable<String> get password => _password.stream.transform(validatePassword);
  Observable<bool> get valid => Observable.combineLatest2(email, password, (e, p) => true);
  Observable<Future<LoginModel>> get login => _login.stream;

  //Getters for sink email and password
  Function(String) get addEmail => _email.sink.add;
  Function(String) get addPassword => _password.sink.add;
  Function(Future<LoginModel>) get addLogin => _login.sink.add;

  dispose(){
    _email.close();
    _password.close();
    _login.close();
  }
}