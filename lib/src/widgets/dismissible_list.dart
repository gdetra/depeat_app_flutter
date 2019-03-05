import 'package:depeat_flutter_app/src/blocs/checkout_provider.dart';
import 'package:flutter/material.dart';

class DismissibleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CheckoutProvider.of(context);

    return StreamBuilder(
      stream: bloc.products,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Dismissible(
              onDismissed: (position){
                bloc.calculatePrice(index);
              },
              key: Key(snapshot.data[index].hashCode.toString()),
              child: ListTile(
                title: Text(snapshot.data[index].name),
                subtitle: Text(
                    "Price: ${snapshot.data[index].price * snapshot.data[index].quantity} €"),
                trailing: Text("X ${snapshot.data[index].quantity}"),
                ),
            );
          },
        );
      },
    );
  }
}
