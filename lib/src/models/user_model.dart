class User{
  String _id;
  String _username;
  String _email;
  bool _confirmed;
  bool _blocked;
  String _provider;
  int _v;

  User.fromJson(Map<String, dynamic> parsedJson){
    _id = parsedJson["_id"];
    _username = parsedJson["username"];
    _email = parsedJson["email"];
    _confirmed = parsedJson["confirmed"];
    _blocked = parsedJson["blocked"];
    _provider = parsedJson["provider"];
    _v = parsedJson["__v"];
  }

  int get v => _v;

  String get provider => _provider;

  bool get blocked => _blocked;

  bool get confirmed => _confirmed;

  String get email => _email;

  String get username => _username;

  String get id => _id;


}