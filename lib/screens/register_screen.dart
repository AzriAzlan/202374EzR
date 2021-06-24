import 'package:ezrestaurantapp/screens/home_screen.dart';
import 'package:ezrestaurantapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final Authenticate _auth = Authenticate();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onRegister() async {
    setState(() {
      _usernameController.text.isEmpty ? widget.usernameEmpty = true : widget.usernameEmpty = false;
      _passwordController.text.isEmpty ? widget.passwordEmpty = true : widget.passwordEmpty = false;
    });
    if(_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }
    else {
      dynamic result = _auth.registerWithEmail(_usernameController.text, _passwordController.text);

      if(result==null) {
        // Error Signin Up
        print("error signup");
        return;
      } else {
        // Signed Up
        print("signedup");
        print(result);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(

      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.png"),
                    fit: BoxFit.cover)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: SizedBox(
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),

                  Text("SIGN UP FOR EZRESTAURANT", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          helperText: widget.usernameEmpty ? "Required":"",
                          helperStyle: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          helperText: widget.passwordEmpty ? "Required":"",
                          helperStyle: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: 200,
                    child: TextButton(
                      onPressed: onRegister,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  side: BorderSide(color: Colors.grey)
                              )
                          )
                      ),
                    ),
                  ),

                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}

