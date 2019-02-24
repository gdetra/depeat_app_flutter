import 'package:depeat_flutter_app/src/api/api.dart';
import 'package:depeat_flutter_app/src/blocs/validators.dart';
import 'package:depeat_flutter_app/src/models/login_model.dart';
import 'package:depeat_flutter_app/src/models/register_model.dart';
import 'package:depeat_flutter_app/src/models/user_model.dart';
import 'package:depeat_flutter_app/src/utils/shared_pref_const.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc with Validators{
  final _email = new BehaviorSubject<String>();
  final _password = new BehaviorSubject<String>();
  final _user = new BehaviorSubject<String>();
  final _authenticated = new BehaviorSubject<bool>();
  final _validLogin = new BehaviorSubject<bool>();
  final _validRegister = new BehaviorSubject<bool>();

  //Getters stream
  Observable<String> get email => _email.stream.transform(validateEmail);
  Observable<String> get password => _password.stream.transform(validatePassword);
  Observable<String> get user => _user.stream.transform(validateUser);
  Observable<bool> get authenticated => _authenticated.stream;
  Observable<bool> get validLogin => Observable.combineLatest2(email, password, (e, p) => true);
  Observable<bool> get validRegister => Observable.combineLatest3(email, password, user, (e, p, u) => true);


  //Getter for sink add
  Function(String) get addEmail => _email.sink.add;
  Function(String) get addPassword => _password.sink.add;
  Function(String) get addUser => _user.sink.add;

  Future<void> doLogin() async {
    String email = _email.value;
    String password = _password.value;

    Api client = Api();
    var model = await client.doLogin(email, password);
    if (model is LoginModel) {
      if (model != null) {
        await _saveInSharedPreferences(model);
        _authenticated.sink.add(true);
      }
    }else{
      _authenticated.sink.add(false);
    }
  }

  Future<void> doRegister() async {
    String email =_email.value;
    String password= _password.value;
    String username = _user.value;
    Api client = Api();
    var model = await client.doRegister(email, password, username);
    if (model is RegisterModel) {
      if (model != null) {
        await _saveInSharedPreferences(model);
        _authenticated.sink.add(true);
      }
    } else {
      _authenticated.sink.add(false);
    }

  }


  _saveInSharedPreferences(model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefsConst.AUTH, model.authCode);
    if(model is LoginModel){
      prefs.setString(SharedPrefsConst.USER_ID, model.loginUserModel.id);
    }else{
      prefs.setString(SharedPrefsConst.USER_ID, model.registerUserModel.id);
    }

    prefs.commit();
  }


  dispose(){
    _email.close();
    _password.close();
    _user.close();
    _authenticated.close();
    _validLogin.close();
    _validRegister.close();
  }

}
