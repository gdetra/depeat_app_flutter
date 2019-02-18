import 'package:depeat_flutter_app/src/models/role_model.dart';
import 'package:depeat_flutter_app/src/models/user_model.dart';

class LoginUserModel extends User{
  Role _role;

  LoginUserModel.fromJson(Map<String, dynamic> parsedJson)
      : _role = Role.fromJson(parsedJson["role"]),
        super.fromJson(parsedJson);

  Role get role => _role;

}