import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/checkout_screens/checkout_order_screen.dart';
import 'package:Comchop/details_screen/product.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/widgets/dashboard_widget.dart';
import 'package:Comchop/widgets/inherited_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class dashboard_screen extends StatefulWidget {
  final lat;
  final lon;
  late final address;
  dashboard_screen({Key? key, this.lat, this.lon, this.address})
      : super(key: key);

  @override
  _dashboard_screenState createState() => _dashboard_screenState();
}

class _dashboard_screenState extends State<dashboard_screen> {
  Position? _currentPosition;
  String? _currentAddress;
  String Address = 'search';
  String locate = '';

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
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong() async {
    Position position = await _getGeoLocationPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    // print(Address);
    setState(() {
      locate = '${place.subLocality}';
    });

    // print(locate);
  }

  @override
  void initState() {
    api_calls().getreview(context);
    GetAddressFromLatLong();
    print(widget.lat);
    print('${widget.lon}new');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final passed_data = InheritedDataProvider.of(context)!.data;
    final badge = Provider.of<api_calls>(context);
    final menuprovider = Provider.of<api_calls>(context);
    menuprovider.locate = Address;
    final List<String> images = [
      'https://comchop.com/public/app/sliderone.png',
      'https://comchop.com/public/app/slidertwo.png',
      'https://comchop.com/public/app/sliderthree.png',
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Text(
              'Delivery to',
              style: TextStyle(
                  color: Color.fromRGBO(252, 186, 24, 1), fontSize: 12),
            ),
            SizedBox(
              height: 5,
            ),
            Text('$passed_data',
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => checkout_order_screens()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Badge(
                        badgeColor: Color.fromRGBO(252, 186, 24, 1),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Text('${badge.index}'),
                        child: Image.network(
                            "https://comchop.com/public/app/icon/carticon.png",
                            color: Colors.black)),
                  )),
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 180,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                    ),
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              height: 185,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Card(
                                  elevation: 2.5,
                                  child: Image.network(
                                    i,
                                    fit: BoxFit.cover,
                                    height: 185,
                                  ),
                                ),
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: menuprovider.menuitems(),
                    builder: (c, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: dashboardwidget().cicularbar(),
                        );
                      }
                      if (!snapshot.hasData)
                        return Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.network(
                                  "https://comchop.com/public/app/icon/sad_emojie.png",
                                  height: 70,
                                  width: 70,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "We'll be right back !",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 25,
                                    color: Color.fromRGBO(252, 186, 24, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Text(
                                  "We are currently not available\nin your area",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.7,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),

                              ],
                            ));

                      if (snapshot.hasData) {
                        return Center(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data['data'].length,
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => product(
                                                  id: snapshot.data['data']
                                                      [index]['id'],
                                                
                                                  img:
                                                      '${menuprovider.imageurl}${snapshot.data['data'][index]['logo_img']}',
                                                )),
                                      );
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      margin:
                                          EdgeInsets.only(left: 15, right: 15),
                                      width: double.infinity,
                                      height: 270,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Image.network(
                                              '${menuprovider.imageurl}${snapshot.data['data'][index]['logo_img']}',
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${snapshot.data['data'][index]['name']}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: Color.fromRGBO(
                                                    252, 186, 24, 1),
                                              ),
                                              Text(
                                                '${snapshot.data['data'][index]['rating']}',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        134, 134, 134, 1),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '(${snapshot.data['data'][index]['reviews']} reviews)',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        134, 134, 134, 1),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                      if (snapshot.hasError) print(snapshot.error.toString());
                      return Align(
                        alignment: Alignment.center,
                        child: dashboardwidget().cicularbar(),
                      );
                    },
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
