import 'package:depeat_flutter_app/src/models/user_model.dart';

class RegisterUserModel extends User {
  String _role;

  RegisterUserModel.fromJson(Map<String, dynamic> parsedJson)
      : _role = parsedJson["role"],
        super.fromJson(parsedJson);

  String get role => _role;
}
