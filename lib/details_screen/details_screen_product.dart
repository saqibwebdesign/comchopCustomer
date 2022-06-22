import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/checkout_screens/checkout_order_screen.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/provider/cartprovider.dart';
import 'package:Comchop/signin_register_screens/find_resturent_near_you.dart';
import 'package:Comchop/widgets/dashboard_widget.dart';
import 'package:Comchop/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class details_screen_products extends StatefulWidget {
  final id;
  final image;
  final resturentid;
  details_screen_products({Key? key, this.id, this.image, this.resturentid})
      : super(key: key);

  @override
  _details_screen_productsState createState() =>
      _details_screen_productsState();
}

class _details_screen_productsState extends State<details_screen_products> {
  var productid = 0;
  var resturentid;
  var variantid = 0;
  var price = 0;
  var quantity;
  int _n = 1;
  int selectedIndex = -1;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  void initState() {
    print(resturentid);
    super.initState();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final badge = Provider.of<api_calls>(context);
    final provider = Provider.of<cartprovider>(context);
    final varient = Provider.of<api_calls>(
      context,
    );
    final addtocat = Provider.of<api_calls>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
          child: Align(
        alignment: Alignment.topLeft,
        child: SafeArea(
          child: FutureBuilder(
            future: varient.deatils_varient(widget.id),
            builder: (c, AsyncSnapshot snap) {

              if (snap.hasData) {
                int _value = 1;
                var data = snap.data['productDetail'][0]['variant'];

                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.image,
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60)),
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Icon(Icons.arrow_back_ios)),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              checkout_order_screens()),
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Badge(
                                        badgeColor:
                                            Color.fromRGBO(252, 186, 24, 1),
                                        animationType: BadgeAnimationType.slide,
                                        badgeContent: Text('${badge.index}'),
                                        child: Image.network(
                                            "https://comchop.com/public/app/icon/carticon.png",
                                            color: Colors.black)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snap.data['productDetail'][0]['title'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(snap.data['productDetail'][0]['description']),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price :' +
                                      '\$' +
                                      snap.data['productDetail'][0]['price']
                                          .toString(),
                                  style: TextStyle(
                                      color: Color.fromRGBO(134, 134, 134, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'preparation time' +
                                      ':' +
                                      snap.data['productDetail'][0]['price']
                                          .toString() +
                                      'min',
                                  style: TextStyle(
                                      letterSpacing: 1.1,
                                      color: Color.fromRGBO(134, 134, 134, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Variation',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snap
                                        .data['productDetail'][0]['variant']
                                        .length ??
                                    0,
                                itemBuilder: (ctx, i) {
                                  var variantname = snap.data['productDetail']
                                      [0]['variant'][i]['name'];

                                  return Column(
                                    children: [
                                      ListTile(
                                          selected:
                                              selectedIndex == i ? true : false,
                                          title: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 223, 217, 217),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 2,
                                                          color:
                                                              selectedIndex == i
                                                                  ? Color
                                                                      .fromRGBO(
                                                                          252,
                                                                          186,
                                                                          24,
                                                                          1)
                                                                  : Color
                                                                      .fromARGB(
                                                                          255,
                                                                          223,
                                                                          217,
                                                                          217),
                                                        ),
                                                        color: selectedIndex ==
                                                                i
                                                            ? Color.fromRGBO(
                                                                252, 186, 24, 1)
                                                            : Color.fromARGB(
                                                                255,
                                                                223,
                                                                217,
                                                                217),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '$variantname',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                          onTap: () {
                                            setState(() {
                                              selectedIndex = i;
                                              productid = snap
                                                      .data['productDetail'][0]
                                                  ['variant'][i]['product_id'];
                                              variantid =
                                                  snap.data['productDetail'][0]
                                                      ['variant'][i]['id'];
                                              price = snap.data['productDetail']
                                                  [0]['price'];
                                              quantity = _n;
                                            });
                                            print(
                                                '${snap.data['productDetail'][0]['variant'][i]['id']}');
                                            print(
                                                '${snap.data['productDetail'][0]['price']}');
                                          }),
                                      Divider()
                                    ],
                                  );
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            new Container(
                              child: new Center(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        add();
                                      },
                                      child:
                                          Icon(Icons.add, color: Colors.black),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.5,
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        primary:
                                            Color.fromRGBO(248, 248, 248, 1),
                                        // <-- Button color
                                        onPrimary: Color.fromRGBO(151, 151, 151,
                                            1), // <-- Splash color
                                      ),
                                    ),
                                    new Text('$_n',
                                        style: new TextStyle(fontSize: 25)),
                                    ElevatedButton(
                                      onPressed: () {
                                        minus();
                                      },
                                      child: Icon(_n == 1 ? null : Icons.remove,
                                          color: Colors.black),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.5,
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        primary:
                                            Color.fromRGBO(248, 248, 248, 1),
                                        // <-- Button color
                                        onPrimary: Color.fromRGBO(151, 151, 151,
                                            1), // <-- Splash color
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: 290,
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Color.fromRGBO(252, 186, 24, 1),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                                ),
                                animationDuration: Duration(seconds: 1),
                                onPressed: () {
                                  if (productid == 0 &&
                                      variantid == 0 &&
                                      price == 0) {
                                    return;
                                  } else {
                                    print('else');
                                    addtocat.add_to_cart(
                                        productid,
                                        widget.resturentid,
                                        variantid,
                                        price,
                                        _n);
                                    setState(() {
                                      badge.index++;
                                    });
                                  }
                                })),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              }

              if (snap.hasError) print(snap.error.toString());
              return Align(
                  alignment: Alignment.bottomCenter,
                  child: dashboardwidget().cicularbar());
            },
          ),
        ),
      )),
    );
  }
}
