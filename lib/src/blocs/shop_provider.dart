import 'package:depeat_flutter_app/src/blocs/shop_bloc.dart';
import 'package:depeat_flutter_app/src/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class ShopProvider extends InheritedWidget {
  final _bloc;

  ShopProvider({Key key, Widget child, ShopBloc bloc})
      : _bloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static ShopBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ShopProvider) as ShopProvider)
        ._bloc;
  }
}
