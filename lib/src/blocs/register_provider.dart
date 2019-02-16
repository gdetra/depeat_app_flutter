import 'package:depeat_flutter_app/src/blocs/register_bloc.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends InheritedWidget {
  final registerBloc;

  RegisterProvider({Key key, Widget child})
      : registerBloc = RegisterBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static RegisterBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(RegisterProvider)
            as RegisterProvider)
        .registerBloc;
  }
}
