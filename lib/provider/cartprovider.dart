import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/Tabbar_screens/tabbar_screen.dart';
import 'package:Comchop/widgets/inherited_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_calls.dart';

class cartprovider with ChangeNotifier {
  bool isloading = false;
  bool animation = false;
  bool iscart = false;
  String locate = '';
  var address;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print(Address);
  }

  String Address = 'search';

  Future currentlocation(BuildContext context) async {
    Position position = await _getGeoLocationPosition();
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final latitude = prefs.setDouble('latitude', position.latitude);
    final longitude = prefs.setDouble('longtitude', position.longitude);
    final latlong = prefs.getDouble('longtitude');
    GetAddressFromLatLong(position);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print('latest address ${place.street}');
    if (latitude.toString().isNotEmpty && latitude.toString().isNotEmpty) {
      locate =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InheritedDataProvider(
                  child: tabbar(),
                  data: Address,
                )),
      );
    } else {
      CircularProgressIndicator();
    }
  }
}
