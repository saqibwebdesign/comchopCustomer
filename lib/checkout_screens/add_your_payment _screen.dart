import 'package:flutter/material.dart';
import 'package:Comchop/checkout_screens/order_complete_screen.dart';

import 'checkout_order_screen.dart';

class add_your_payment_screen extends StatelessWidget {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Color.fromRGBO(252, 186, 24, 1),
                        borderRadius: BorderRadius.circular(25)),
                    height: 15,
                    width: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                      child: Text(
                    'Cash on Delivery ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
