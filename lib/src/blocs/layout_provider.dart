import 'package:depeat_flutter_app/src/blocs/layout_bloc.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends InheritedWidget{
  final _layoutBloc;

  LayoutProvider({Key key, Widget child, LayoutBloc bloc})
    : _layoutBloc = bloc,
      super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static LayoutBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(LayoutProvider) as LayoutProvider)._layoutBloc;
  }


}
