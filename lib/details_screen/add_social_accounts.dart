
import 'package:flutter/material.dart';

class add_social_account_screen extends StatelessWidget {
  const add_social_account_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Add Social Accounts',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Add social accounts',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 10,),
          Text(
            'Add your social accounts for more  security.',
            style: TextStyle(
            color: Color.fromRGBO(134, 134, 134, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400),
          ),
          Text(
            ' You will go directly to their site.',
            style: TextStyle(
                color: Color.fromRGBO(134, 134, 134, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(57, 89, 152, 1),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Container(
                child: ListTile(
                  title: Text(
                    'Connects with Facebook',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(66, 133, 244, 1),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Container(
                child: ListTile(
                  title: Text(
                    'Connects with Goggle',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
