import 'package:firebase_auth/firebase_auth.dart';



class Authenticate {

  FirebaseAuth auth = FirebaseAuth.instance;




  static authenticate(String username,String password) async {

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }


  print(username);
  print(password);


}

}

