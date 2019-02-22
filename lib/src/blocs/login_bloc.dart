import 'package:depeat_flutter_app/src/api/api.dart';
import 'package:depeat_flutter_app/src/models/login_model.dart';
import 'package:depeat_flutter_app/src/utils/shared_pref_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'validators.dart';

class LoginBloc with Validators{
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();
  final _authenticated = new PublishSubject<bool>();

  //getters for email and password
  Observable<String> get email => _email.stream.transform(validateEmail);
  Observable<String> get password => _password.stream.transform(validatePassword);
  Observable<bool> get valid => Observable.combineLatest2(email, password, (e, p) => true);
  Observable<bool> get authenticated => _authenticated.stream;

  //Getters for sink email and password
  Function(String) get addEmail => _email.sink.add;
  Function(String) get addPassword => _password.sink.add;

  Future<void> doLogin() async {
    String email = _email.value;
    String password = _password.value;

    Api client = Api();
    var model = await client.doLogin(email, password);
    if (model is LoginModel) {
      if (model != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(SharedPrefsConst.AUTH, model.authCode);
        prefs.setString(SharedPrefsConst.USER_ID, model.loginUserModel.id);
        prefs.commit();
        _authenticated.sink.add(true);
      }
    }else{
      _authenticated.sink.add(false);
    }
  }

  dispose(){
    _email.close();
    _password.close();
    _authenticated.close();
  }
}