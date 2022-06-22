import 'package:flutter/material.dart';
import 'package:Comchop/signin_register_screens/create_account_screen.dart';
import 'package:Comchop/signin_register_screens/find_resturent_near_you.dart';
import 'package:Comchop/signin_register_screens/otp_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class phone_number_screen extends StatelessWidget {
  const phone_number_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                'Get started with Foodly',
                style: TextStyle(color: Colors.black, fontSize: 24),
              )),
              Center(
                  child: Text(
                'Enter your phone number to use foodly ',
                style: TextStyle(
                    color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
              )),
              Center(
                  child: Text(
                'and enjoy your food. ',
                style: TextStyle(
                    color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
              )),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 334,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1, right: 30),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(242, 242, 242, 1),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(242, 242, 242, 1),
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red))),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                    height: 40,
                    width: 160,
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color.fromRGBO(252, 186, 24, 1),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    otp_screen()),
                          );
                        })),
              ),
            ],
          ),
        ));
  }
}
