import 'package:ezrestaurantapp/models/menuItem.dart';
import 'package:ezrestaurantapp/screens/cart_screen.dart';
import 'package:ezrestaurantapp/screens/favourite_screen.dart';
import 'package:ezrestaurantapp/screens/login_screen.dart';
import 'package:ezrestaurantapp/services/auth.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezrestaurantapp/services/database.dart';
import 'package:provider/provider.dart';

import '../menu_list.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //final FirebaseFirestore firebase = FirebaseFirestore.instance;
  int _selectedIndex=0;
  final Authenticate _auth = Authenticate();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<MenuItem>>.value(
      value: DatabaseService().menu,
      child: Scaffold(
      appBar: AppBar(
      title: Text('EzRestaurant'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text("Logout"),
              onPressed: () async{
                dynamic result = await _auth.signOut();

                if(result==null) {

                  print("signout");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
              },
          ),
        ],

      ),
        body: MenuList(),

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
          ],
        currentIndex: _selectedIndex,
        onTap:  (_selectedIndex) {
            switch(_selectedIndex) {
              case 1: Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
                break;

              case 2: Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouriteScreen()),
              );

            }
        },
        ),

    ),);
  }
}

