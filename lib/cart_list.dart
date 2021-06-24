import 'package:ezrestaurantapp/models/menuCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_tile.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final menu = Provider.of<List<MenuCart>>(context);

    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) {
        return CartTile(item: menu[index]);
      },
    );
  }
}
