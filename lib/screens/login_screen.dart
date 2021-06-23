import 'package:ezrestaurantapp/provider/auth.dart';
import 'package:ezrestaurantapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("WELCOME TO EZRESTAURANT"),

            SizedBox(
              width: 300,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),

            SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                  Authenticate.authenticate(usernameController.text,passwordController.text);



                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder:(context)=>HomeScreen()),
                  // );

                },
                child: Text("Sign in")),

            SizedBox(height: 20),
            Text("Dont have an account ? Sign up here")

          ],
        ),

      ),
    );
  }
}
