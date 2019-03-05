import 'package:depeat_flutter_app/src/blocs/checkout_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/checkout_provider.dart';
import 'package:depeat_flutter_app/src/models/order_model.dart';
import 'package:depeat_flutter_app/src/models/product_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:depeat_flutter_app/src/widgets/dismissible_list.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CheckoutProvider.of(context);

    return Scaffold(
      bottomNavigationBar: buildBottomAppBar(bloc),
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: buildRestaurantDetail(bloc),
    );
  }

  Widget buildRestaurantDetail(CheckoutBloc bloc) {
    return StreamBuilder(
      stream: bloc.restaurant,
      builder: (context, AsyncSnapshot<Restaurant> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        Restaurant restaurant = snapshot.data;
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 20.0),
                )),
              ),
              Divider(),
              Expanded(
                child: DismissibleList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildBottomAppBar(CheckoutBloc bloc) {
    return StreamBuilder(
      stream: bloc.total,
      builder: (context, snapshot) {
        return BottomAppBar(
          color: Colors.white,
          elevation: 4.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: StreamBuilder(
                      stream: bloc.enabledButton,
                      builder: (context, boolSnapshot){
                        if(!boolSnapshot.hasData){
                          return
                            Center(child: CircularProgressIndicator(),);
                        }
                        return RaisedButton(
                          child: Text("PAY : ${snapshot.data} €"),
                          onPressed: boolSnapshot.data ? () {} : null,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
