import 'package:Comchop/details_screen/product.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/models/order_details_.dart';
import 'package:Comchop/models/resturantCatagory.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/services/getcategories_api.dart';
import 'package:Comchop/services/orderdetails_api.dart';
import 'package:Comchop/widgets/dashboard_widget.dart';
import 'package:provider/provider.dart';

class subcategories extends StatefulWidget {
  subcategories({Key? key, this.id,this.name}) : super(key: key);
  final id;
  final name;
  @override
  State<subcategories> createState() => _subcategoriesState();
}

class _subcategoriesState extends State<subcategories> {

  @override
  Widget build(BuildContext context) {
        final menuprovider = Provider.of<api_calls>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,  
        elevation: 0.0,
        title: Text('Search for "${widget.name}" ',
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
      body: Container(
        child: Column(
          children: [
          
            FutureBuilder<restuarantCategory>(
              future: get_categories().subCatagories_product(widget.id),
             builder: (c, snap) {
                if (!snap.hasData)
                        return Align(
                    alignment: Alignment.center,
                    child: dashboardwidget().cicularbar());
                if (snap.data!.data!.isEmpty)
                        return Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                               
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Nothing to Show",
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
                if (snap.hasData)
                  return Center(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                               itemCount: snap.data!.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      print('${snap.data!.menus![index].restaurantId}');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => product(
                                                  id:   '${snap.data!.menus![index].restaurantId}',
                                                 
                                                  img:
                                                      '${menuprovider.imageurl}${snap.data!.data![index].logoImg}',
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
                                              '${menuprovider.imageurl}${snap.data!.data![index].logoImg}',
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${snap.data!.data![index].name}',
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
                                                '${snap.data!.data![index].rating}',
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
                                                '(${snap.data!.data![index].reviews} reviews)',
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

                if (snap.hasError)
                  print("aaaaaaaaaaaaaaaaaaaaaaa" + snap.error.toString());
                return Align(
                    alignment: Alignment.center,
                    child: dashboardwidget().cicularbar());
              },
            )
          ],
        ),
      ),
    );
  }
}
