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
        if(snapshot.data.length == 0){
          return Center(child: Text("Your cart is empty."),);
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Dismissible(
              confirmDismiss: (direction){
                return _showDialog(context);
              },
              background: Container(
                padding: EdgeInsets.only(right: 8.0),
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.restore_from_trash,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Remove",
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
              ),
              onDismissed: (position) {
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



  Future<bool> _showDialog(BuildContext context) async{
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Warning"),
          content: new Text("Are you sure that you want to delete that item?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            ),
            new FlatButton(
              child: new Text("No"),
              onPressed: (){
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}
