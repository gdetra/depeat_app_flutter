import 'package:depeat_flutter_app/src/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';

class AuthProvider extends InheritedWidget {
  final authBloc;

  AuthProvider({Key key, Widget child, AuthBloc bloc})
      : authBloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthProvider)
            as AuthProvider)
        .authBloc;
  }
}
