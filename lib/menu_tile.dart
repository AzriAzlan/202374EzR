import 'package:ezrestaurantapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:ezrestaurantapp/models/menuItem.dart';
import 'package:toast/toast.dart';


class MenuTile extends StatelessWidget {
  final MenuItem item;
  MenuTile({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.lightGreenAccent,
          ),
          trailing: GestureDetector(
            child: Icon(Icons.add_shopping_cart),
            onTap: () async {
              await DatabaseService().addToCart(item.name, item.price);
              Toast.show("Succesfully added to cart", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER,backgroundRadius: 5);

            },
          ),
          title: Text(item.name),
          subtitle: Text('Price ${item.price}'),
        ),
      ),
    );
  }
}
