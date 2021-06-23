import 'package:ezrestaurantapp/screens/cart_screen.dart';
import 'package:ezrestaurantapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("My Favourites"),
        automaticallyImplyLeading: false,
      ),

      body: Container(

        child: GridView.count(

          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,

          children: <Widget>[

            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.add_shopping_cart),
                        Icon(Icons.favorite,color:Colors.red)
                      ],
                    ),
                    Icon(Icons.album,
                      size: 100,),
                    Text("Nasi Lemak"),

                  ],
                ),
              ),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.add_shopping_cart),
                        Icon(Icons.favorite,color:Colors.red)
                      ],
                    ),
                    Icon(Icons.album,
                      size: 100,),
                    Text("Mi Goreng"),

                  ],
                ),
              ),
              color: Colors.teal[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.add_shopping_cart),
                        Icon(Icons.favorite,color:Colors.red)
                      ],
                    ),
                    Icon(Icons.album,
                      size: 100,),
                    Text("Ayam Goreng"),

                  ],
                ),
              ),
              color: Colors.teal[300],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.add_shopping_cart),
                        Icon(Icons.favorite,color:Colors.red)
                      ],
                    ),
                    Icon(Icons.album,
                      size: 100,),
                    Text("Roti Canai"),

                  ],
                ),
              ),
              color: Colors.teal[400],
            ),

          ],

        ),

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
          onTap: (_selectedIndex) {
            switch (_selectedIndex) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
                break;

              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
            }
          }
      ),


    );


  }
}
