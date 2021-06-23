import 'package:ezrestaurantapp/menu_tile.dart';
import 'package:ezrestaurantapp/models/menuItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {

    final menu = Provider.of<List<MenuItem>>(context);

    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context,index) {
        return MenuTile(item : menu[index]);
      },
    );
  }
}
