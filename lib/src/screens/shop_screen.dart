import 'package:depeat_flutter_app/src/blocs/shop_bloc.dart';
import 'package:depeat_flutter_app/src/blocs/shop_provider.dart';
import 'package:depeat_flutter_app/src/models/product_model.dart';
import 'package:depeat_flutter_app/src/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ShopProvider.of(context);

    return Scaffold(
      bottomNavigationBar: buildBottomAppBar(bloc),
      body: Stack(
        children: <Widget>[
          buildCustomScrollView(bloc),
        ],
      ),
    );
  }

  Widget buildCustomScrollView(ShopBloc bloc) {
    return CustomScrollView(slivers: <Widget>[
      buildSliverAppBar(bloc),
      buildSliverList(bloc),
    ]);
  }


  Widget buildSliverList(ShopBloc bloc){
    return StreamBuilder(
        stream: bloc.products,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: CircularProgressIndicator(),
                ),
              ]),
            );
          }
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => buildCard(index, snapshot.data[index], bloc),
                childCount: snapshot.data.length,
              )
          );
        }
    );
  }

  Widget buildSliverAppBar(ShopBloc bloc) {
    return StreamBuilder(
      stream: bloc.restaurant,
      builder: (context, AsyncSnapshot<Restaurant> snapshot) {
        if (!snapshot.hasData) {
          return SliverAppBar(
            pinned: true,
            expandedHeight: 256.0,
          );
        }
        return SliverAppBar(
          pinned: true,
          expandedHeight: 256.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("${snapshot.data.name}"),
            background: Opacity(
              opacity: 0.6,
              child: Image.network(
                "${snapshot.data.urlImage}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildBottomAppBar(ShopBloc bloc) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 4.0,
      child: Container(
        height: 96,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            StreamBuilder(
              stream: bloc.total,
              builder: (context, AsyncSnapshot<double> snapshot){
                return Text(
                  "Total: ${snapshot.data} €",
                  style: TextStyle(fontSize: 32.0),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: LinearProgressIndicator(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: RaisedButton(
                      child: Text("CHECKOUT"),
                      onPressed: () {
                        bloc.getListOfBoughtProducts();
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCounter(Product product, ShopBloc bloc, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          shadowColor: Colors.blue,
          child: InkWell(
              onTap: (){
                bloc.decreaseQuantity(index);
              },
              borderRadius: BorderRadius.circular(32.0),
              child: Container(
                margin: EdgeInsets.all(8.0),
                height: 32.0,
                width: 32.0,
                child: Icon(Icons.remove),
              )),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "${product.quantity}",
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
        Material(
          color: Colors.transparent,
          shadowColor: Colors.blue,
          child: InkWell(
              onTap: (){
                bloc.increaseQuantity(index);
              },
              borderRadius: BorderRadius.circular(32.0),
              child: Container(
                margin: EdgeInsets.all(8.0),
                height: 32.0,
                width: 32.0,
                child: Icon(Icons.add),
              )),
        ),
      ],
    );
  }

  Widget buildCard(int index, Product product, ShopBloc bloc) {
    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            buildCircularAvatar(product),
            cardMiddle(product),
            buildCounter(product, bloc , index),
          ],
        ),
      ),
    );
  }

  Widget cardMiddle(Product product) {
    return Expanded(
      child: new Container(
        padding: new EdgeInsets.only(left: 8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text(
              product.name,
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            new Text(
              "Price: ${product.price}",
              style: new TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircularAvatar(Product product) {
    return CircleAvatar(
      radius: 32.0,
      backgroundImage: NetworkImage(
          product.urlImage),
      backgroundColor: Colors.transparent,
    );
  }
}
