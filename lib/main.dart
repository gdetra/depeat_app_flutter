import 'package:depeat_flutter_app/src/app.dart';
import 'package:depeat_flutter_app/src/blocs/auth_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/auth_provider.dart';
import 'package:depeat_flutter_app/src/blocs/checkout_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/checkout_provider.dart';
import 'package:depeat_flutter_app/src/blocs/layout_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/layout_provider.dart';
import 'package:depeat_flutter_app/src/blocs/main_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/main_provider.dart';
import 'package:depeat_flutter_app/src/blocs/shop_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/shop_provider.dart';
import 'package:flutter/material.dart';

void main() {
  AuthBloc authBloc = AuthBloc();
  ShopBloc shopBloc = ShopBloc();
  CheckoutBloc checkoutBloc = CheckoutBloc();
  LayoutBloc layoutBloc = LayoutBloc();
  MainBloc mainBloc = MainBloc();

  runApp(
    CheckoutProvider(
      bloc: checkoutBloc,
      child: ShopProvider(
        bloc: shopBloc,
        child: MainProvider(
          bloc: mainBloc,
          child: AuthProvider(
            bloc: authBloc,
            child: LayoutProvider(
              bloc: layoutBloc,
              child: App(),
            ),
          ),
        ),
      ),
    ),
  );
}
