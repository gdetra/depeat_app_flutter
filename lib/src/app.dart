import 'package:depeat_flutter_app/src/screens/checkout_screen.dart';
import 'package:depeat_flutter_app/src/screens/login_screen.dart';
import 'package:depeat_flutter_app/src/screens/main_screen.dart';
import 'package:depeat_flutter_app/src/screens/register_screen.dart';
import 'package:depeat_flutter_app/src/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      routes: <String, WidgetBuilder>{
        "/LoginScreen" : (_) => LoginScreen(),
        "/RegisterScreen" : (_) => RegisterScreen(),
        "/ShopScreen" : (_) =>  ShopScreen(),
        "/CheckoutScreen": (_) => CheckoutScreen(),
      },
    );
  }

}
