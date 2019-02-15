import 'package:flutter/material.dart';

import 'login_bloc.dart';

class LoginProvider extends InheritedWidget {
  final loginBloc;

  LoginProvider({Key key, Widget child})
      : loginBloc = new LoginBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginProvider)
            as LoginProvider)
        .loginBloc;
  }
}
