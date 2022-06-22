import 'package:flutter/material.dart';
import 'package:Comchop/models/activeorders.dart';
import 'package:Comchop/models/order_details_.dart';
import 'package:Comchop/provider/cartprovider.dart';
import 'package:Comchop/services/active_orders.dart';
import 'package:Comchop/services/orderdetails_api.dart';
import 'package:Comchop/widgets/dashboard_widget.dart';
import 'package:Comchop/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class Activeorders extends StatelessWidget {
  const Activeorders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeorder = active_orders();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Active Orders',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
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
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Orders',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder<activeorders>(
              future: activeorder.getactiveorders(),
              builder: (c, snap) {
                if (!snap.hasData)
                  return Align(
                      alignment: Alignment.center,
                      child: dashboardwidget().cicularbar());
                if (snap.hasData)
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snap.data!.orders!.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${activeorder.imageurl}${snap.data!.orders![index].restaurant!.logoImg}'),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      'Order ID: ${snap.data!.orders![index].id}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      //      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${snap.data!.orders![index].restaurant!.name}',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(1, 15, 7, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '\$${snap.data!.orders![index].totalPrice}',
                                style: TextStyle(
                                    color: Color.fromRGBO(252, 186, 24, 1),
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                if (snap.hasError) print(snap.error.toString());
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
