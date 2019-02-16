import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if (emailValid) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid Email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError('Enter a valid password');
    }
  });

  final validateUser = StreamTransformer<String, String>.fromHandlers(handleData: (user, sink){
    if(user.length > 5){
      sink.add(user);
    }else{
      sink.addError("Enter a valid user");
    }
  });
}
