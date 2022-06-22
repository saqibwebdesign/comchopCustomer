import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class snackbar {


  snack(BuildContext context, route, text,key) {
    final snackBar = SnackBar(
        elevation: 6.0,
        backgroundColor: Color.fromRGBO(252, 186, 24, 1),
        content: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => route));
          },
          child: Container(
            height: 20,
              width: 20,
              child: Center(child: Text('Checkout')))
        ));
    key.currentState!.showSnackBar(snackBar);
  }
}
