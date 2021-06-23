import 'package:ezrestaurantapp/screens/home_screen.dart';
import 'package:ezrestaurantapp/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final Authenticate _auth = Authenticate();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        body: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("SIGNUP FOR EZRESTAURANT"),

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

              Builder(
                builder: (context) =>
                    ElevatedButton(
                        onPressed: () async{
                          dynamic result = _auth.registerWithEmail(usernameController.text, passwordController.text);

                          if(result==null) {
                            print("error signup");
                          } else {
                            print("signedup");
                            print(result);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          }
                        },

                        child: Text("Sign UP")),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

