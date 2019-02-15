import 'package:depeat_flutter_app/src/app.dart';
import 'package:depeat_flutter_app/src/blocs/layout_provider.dart';
import 'package:depeat_flutter_app/src/blocs/login_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: LayoutProvider(
        child: MaterialApp(
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(
        builder: (context) {
          final bloc = LayoutProvider.of(context);
          bloc.addIsGrid(false);
          return DepEat();
        },
      );
    } else if (settings.name == "/ShopScreen") {
    } else if (settings.name == "/CheckOutScreen") {
    } else if (settings.name == "/LoginScreen") {
    } else if (settings.name == "/SignInScreen") {}
  }
}
