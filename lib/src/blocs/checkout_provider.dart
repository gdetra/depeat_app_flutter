import 'package:depeat_flutter_app/src/blocs/checkout_bloc.dart';
import 'package:flutter/material.dart';

class CheckoutProvider extends InheritedWidget {
  final CheckoutBloc _bloc;

  CheckoutProvider({Key key, Widget child, CheckoutBloc bloc})
      : _bloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static CheckoutBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CheckoutProvider)
            as CheckoutProvider)
        ._bloc;
  }
}
