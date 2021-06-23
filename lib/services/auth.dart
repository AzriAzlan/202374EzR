import 'package:firebase_auth/firebase_auth.dart';

class Authenticate {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  //sign in with email and password
  Future signInEmail(String email , String password) async {

    try{
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
      );

      User user = result.user;
      return user;
    }catch(e) {
      print(e.toString());
      return null;
    }
  }


  //register with email and password

  Future registerWithEmail(String email , String password) async {

    try{

      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password);

      User user = result.user;
      return user;

    }catch(e) {
      print(e.toString());
      return null;
    }
  }




  //sign out
  Future signOut() async {

    try{
      return await _firebaseAuth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }


  }


}

