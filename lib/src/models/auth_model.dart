class Auth{
  static final String AUTH = "jwt";
  String _jwt;

  Auth(String jwt){
    this._jwt = jwt;
  }

  String get authCode => _jwt;
}