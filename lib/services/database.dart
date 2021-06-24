import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezrestaurantapp/models/menuCart.dart';
import 'package:ezrestaurantapp/models/menuItem.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference menuCollection =
      FirebaseFirestore.instance.collection('menu');
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');

  Future addToCart(String name, num price) async {
    return await cartCollection.doc(uid).set({
      'name': name,
      'price': price,
    });
  }

  List<MenuItem> _menuItemFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MenuItem(
        name: doc.get('name') ?? " ",
        price: doc.get('price') ?? 0,
      );
    }).toList();
  }

  List<MenuCart> _cartItemFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MenuCart(
        name: doc.get('name') ?? " ",
        price: doc.get('price') ?? 0,
      );
    }).toList();
  }

  Stream<List<MenuItem>> get menu {
    return menuCollection.snapshots().map(_menuItemFromSnapshot);
  }

  Stream<List<MenuCart>> get cart {
    return cartCollection.snapshots().map(_cartItemFromSnapshot);
  }
}
