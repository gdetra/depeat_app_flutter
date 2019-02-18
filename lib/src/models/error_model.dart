class ErrorModel{
  int _statusCode;
  String _error;
  String _message;

  ErrorModel.fromJson(Map<String, dynamic> parsedJson)
      : _statusCode = parsedJson["statusCode"],
        _error = parsedJson["error"],
        _message = parsedJson["message"];

  String get message => _message;

  String get error => _error;

  int get statusCode => _statusCode;


}