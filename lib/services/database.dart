import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezrestaurantapp/models/menuItem.dart';

class DatabaseService {
  final CollectionReference menuCollection = FirebaseFirestore.instance.collection('menu');


  List<MenuItem> _menuItemFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return MenuItem(
        name: doc.get('name') ?? " ",
        price: doc.get('price') ?? 0,
      );
    }).toList();
  }


  Stream<List<MenuItem>> get menu {
    return menuCollection.snapshots().map(_menuItemFromSnapshot);
  }


}
