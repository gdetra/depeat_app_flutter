import 'package:depeat_flutter_app/src/blocs/main_bloc.dart';
import 'package:flutter/material.dart';

class MainProvider extends InheritedWidget {
  final _bloc;

  MainProvider({Key key, Widget child, MainBloc bloc})
      : _bloc = bloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static MainBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MainProvider) as MainProvider)
        ._bloc;
  }
}
