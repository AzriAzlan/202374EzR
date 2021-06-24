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

  void onLogout() async {
    dynamic result = await _auth.signOut();

    if(result==null) {
      print("signout");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<MenuItem>>.value(
      value: DatabaseService().menu,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
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

      ),*/
        body: Container(

          child: Column(
            children: [

              Stack(
                children: [

                  SizedBox(
                    child: Image(
                      image: AssetImage('assets/home_bar.png'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 300.00, top: 30.00),
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      icon: Icon(Icons.person),
                      label: Text("Logout"),
                      onPressed: onLogout,
                    ),
                  ),

                ],
              ),

              SizedBox(child: MenuList(), height: 600, width: double.maxFinite,),

            ],
          ),

          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.cover)),
        ),

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

