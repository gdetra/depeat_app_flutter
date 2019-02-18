import 'dart:convert';

import 'package:depeat_flutter_app/src/models/auth_model.dart';
import 'package:depeat_flutter_app/src/models/login_user_model.dart';

class LoginModel extends Auth{
  static final String ENDPOINT = "auth/local";
  LoginUserModel _loginUserModel;

  LoginModel.fromJson(Map<String, dynamic> parsedJson)
      : _loginUserModel = new LoginUserModel.fromJson(parsedJson["user"]),
        super(parsedJson["jwt"]);

  LoginUserModel get loginUserModel => _loginUserModel;


}