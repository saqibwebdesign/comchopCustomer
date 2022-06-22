import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/models/categories_model.dart';

class services{
  var snapshot;
  Widget future_builder(future,sucess,type){
    return
      FutureBuilder<Categories>(
      future: future ,
      builder: (context,AsyncSnapshot dataSnapshot  ) {
        snapshot = dataSnapshot.data;
        print('message :$snapshot');
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (dataSnapshot.error != null) {
            return Center(
              child: Text('An error occured'),
            );
          } else {
            return sucess;

          }
        }
      },
    );
  }
}