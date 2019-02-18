class Role{
  String _id;
  String _name;
  String _description;
  String _type;
  int _v;

  Role.fromJson(Map<String, dynamic> parsedJson)
      : _id = parsedJson["id"],
        _name = parsedJson["name"],
        _description = parsedJson["description"],
        _type = parsedJson["type"],
        _v = parsedJson["__v"];

  int get v => _v;

  String get type => _type;

  String get description => _description;

  String get name => _name;

  String get id => _id;


}

