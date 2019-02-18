import 'package:depeat_flutter_app/src/models/auth_model.dart';
import 'package:depeat_flutter_app/src/models/register_user_model.dart';

class RegisterModel extends Auth{
  static final String ENDPOINT = "auth/local";
  RegisterUserModel _registerUserModel;

  RegisterModel.fromJson(Map<String, dynamic> parsedJson)
      : _registerUserModel = new RegisterUserModel.fromJson(parsedJson["user"]),
        super(parsedJson["jwt"]);

  RegisterUserModel get registerUserModel => _registerUserModel;


}