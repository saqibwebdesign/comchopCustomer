import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:Comchop/Tabbar_screens/tabbar_screen.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/provider/cartprovider.dart';
import 'package:Comchop/services/notifications.dart';
import 'package:Comchop/widgets/inherited_widget.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:provider/provider.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

class find_resturent extends StatefulWidget {
  final sts;
  const find_resturent({Key? key, this.sts}) : super(key: key);

  @override
  State<find_resturent> createState() => _find_resturentState();
}

class _find_resturentState extends State<find_resturent> {
  PusherClient? pusher;
  Channel? channel;
  String? _title;
  String? _orderid;

  @override
  void initState() {
    super.initState();

    pusher = PusherClient(
        "80ca8167ced5361525f1",
        PusherOptions(
          encrypted: false,
          cluster: 'ap2',
        ),
        enableLogging: true,
        autoConnect: false);

    pusher!.connect();
    channel = pusher!.subscribe("cust_notification_${widget.sts}");

    pusher!.onConnectionStateChange((state) {
      log("previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });
    print(widget.sts);
    pusher!.onConnectionError((error) {
      log("error: ${error!.message}");
    });

    channel!.bind('getCustNotify', (event) {
      var data = event?.data;
      var jsonsDataString = data
          .toString(); // toString of Response's body is assigned to jsonDataString
      var _data = json.decode(jsonsDataString);
      print(widget.sts);
      setState(() {
        _title = _data['title'];
        _orderid = _data['orderId'];
        NotificationService()
            .showNotification(1, "$_title", "Order# : $_orderid", 10);
      });
    });
    tz.initializeTimeZones();
  }

  final TextEditingController address = TextEditingController();
  final TextEditingController places = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locationservices_provider = Provider.of<cartprovider>(context);
    final menu = Provider.of<api_calls>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              'Find restaurants near you ',
              style: TextStyle(color: Colors.black, fontSize: 24),
            )),
            Center(
                child: Text(
              'Please enter your location or allow acess',
              style: TextStyle(
                  color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
            )),
            Center(
                child: Text(
              ' to find restaurants near you.',
              style: TextStyle(
                  color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
            )),
            SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  locationservices_provider.currentlocation(context);
                },
                child: Container(
                    height: 50,
                    width: 310,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(252, 186, 24, 1),
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_location_outlined,
                          color: Color.fromRGBO(252, 186, 24, 1),
                        ),
                        Text(
                          'User Current Location',
                          style: TextStyle(
                            color: Color.fromRGBO(252, 186, 24, 1),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),Consumer<api_calls>(builder: (context, provider, child) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(242, 242, 242, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: 310,
                child: GooglePlaceAutoCompleteTextField(
                    textEditingController: address,
                    googleAPIKey: "AIzaSyBqbSrUAVOzB8XxWLOS9nxADhSJszNlEkA",
                    inputDecoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_location,
                        color: Color.fromRGBO(252, 186, 24, 1),
                      ),
                      prefixStyle: TextStyle(color: Colors.grey),
                      hintText: 'Enter a New Address',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(242, 242, 242, 1),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(242, 242, 242, 1),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    debounceTime: 800,
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      print("placeDetails" +
                          prediction.lat.toString() +
                          prediction.lng.toString());
                      provider.lat = prediction.lat;
                      provider.long = prediction.lng;
                      print(provider.lat);
                      print(provider.long);
                      print(address.text);
                    },
                    itmClick: (Prediction prediction) async {
                      final _prefs = SharedPreferences.getInstance();
                      final SharedPreferences prefs = await _prefs;
                      final latitude = prefs.setDouble(
                          'latitude', double.parse('${provider.lat}'));
                      final longitude = prefs.setDouble(
                          'longtitude', double.parse('${provider.long}'));
                      address.selection = TextSelection.fromPosition(
                          TextPosition(offset: prediction.description!.length));
                    }),
              );
            }),
            SizedBox(
              height: 25,
            ),
            Center(
              child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  height: 45,
                  width: 160,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color.fromRGBO(252, 186, 24, 1),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (address.text.isNotEmpty) {
                          locationservices_provider.locate = address.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InheritedDataProvider(
                                      child: tabbar(),
                                      data: address.text,
                                    )),
                          );
                        } else {
                          return;
                        }
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
