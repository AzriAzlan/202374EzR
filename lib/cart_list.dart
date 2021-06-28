import 'package:ezrestaurantapp/models/menuCart.dart';
import 'package:ezrestaurantapp/screens/home_screen.dart';
import 'package:ezrestaurantapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_tile.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:cool_alert/cool_alert.dart';



class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {

  bool checking = true;

  @override
  Widget build(BuildContext context) {
    final menu = Provider.of<List<MenuCart>>(context);

    setState(() {
      if(menu.length>0) {
        checking=false;
      }
    });

    return checking? Center(child: Text("Nothing here for now , add to cart from the home screen!"),):Column(
      children: [
        Expanded(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return CartTile(item: menu[index]);
              },
            ),
          ),
        ),
        SizedBox(height: 20,),

        SizedBox(
          width:250,
          height: 50,
          child: ElevatedButton(onPressed: () async {
           int result = await DatabaseService().getFromCart();

           showDialog(

               context: context,builder: (_) => AssetGiffyDialog(
             image: Image(
               image: AssetImage('assets/payment.gif'),
             ),
             title: Text('Your total is RM$result',
               style: TextStyle(
                   fontSize: 22.0, fontWeight: FontWeight.w600),
             ),
             description: Text('By proceeding , you will be redirected to the FPX gateway to select a payment method of your choice.',
               textAlign: TextAlign.center,
               style: TextStyle(),
             ),
             entryAnimation: EntryAnimation.BOTTOM_RIGHT,
             onOkButtonPressed: () async {

               CoolAlert.show(
                   context: context,
                   type: CoolAlertType.loading,
               );

               await Future.delayed(Duration(milliseconds: 3000));

               await DatabaseService().emptyCart();

               CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  text: "Your transaction was successful!",
                  onConfirmBtnTap: () => {

                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  )
                }
                );
             },
           )
           );
          }, child: Text("Proceed To Checkout")),
        ),
        SizedBox(height: 20,),


      ],
    );
  }
}
