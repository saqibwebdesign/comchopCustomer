import 'package:flutter/material.dart';
import 'package:Comchop/models/userdetails_model.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/services/userdetails_api/userdetails_api.dart';
import 'package:Comchop/signin_register_screens/otp_screen.dart';

import 'package:provider/provider.dart';

import '../widgets/dashboard_widget.dart';

class profile_details_screen extends StatelessWidget {
  const profile_details_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    final profiledetails = Provider.of<api_calls>(context);
    var profile = userdetaills_api();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Profile Settings',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Userdetails>(
            future: profile.getuserdetails(),
            builder: (c, snapshot) {
              if (!snapshot.hasData)
                return Align(
                  alignment: Alignment.center,
                  child: dashboardwidget().cicularbar(),
                );
              _nameController.text =
                  snapshot.data!.user!.name ?? _nameController.text;
              _email.text = snapshot.data!.user!.email ?? _nameController.text;
              _password.text =
                  snapshot.data!.user!.phone ?? _nameController.text;

              if (snapshot.hasData)
                return Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full name',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        readOnly: true,
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Email address',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: _password,
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 300,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                                height: 50,
                                width: 290,
                                child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Color.fromRGBO(252, 186, 24, 1),
                                    child: Text(
                                      'Change settings',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      profile.updateuserdetails(
                                          _nameController.text, _password.text);
                                    })),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              if (snapshot.hasError) print(snapshot.error.toString());
              return Align(
                alignment: Alignment.center,
                child: dashboardwidget().cicularbar(),
              );
            }),
      ),
    );
  }
}
