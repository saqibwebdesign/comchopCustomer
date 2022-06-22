import 'package:flutter/material.dart';
import 'package:Comchop/models/order_details_.dart';
import 'package:Comchop/provider/cartprovider.dart';
import 'package:Comchop/services/orderdetails_api.dart';
import 'package:Comchop/widgets/dashboard_widget.dart';
import 'package:provider/provider.dart';

class orders extends StatelessWidget {
  const orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var order = order_details();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Orders',
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
                    'Previous orders',
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
            FutureBuilder<OrderDetails>(
              future: order.getorders(),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${order.imageurl}${snap.data!.orders![index].restaurant!.logoImg}'),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${snap.data!.orders![index].restaurant!.name}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${snap.data!.orders![index].restaurant!.ownerName}',
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 15, 7, 1),
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$\$',
                                      style: TextStyle(
                                          color: Color.fromRGBO(1, 15, 7, 1),
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Chinese',
                                      style: TextStyle(
                                          color: Color.fromRGBO(1, 15, 7, 1),
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 95,
                                    ),
                                    Text(
                                      '\$${snap.data!.orders![index].totalPrice}',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(252, 186, 24, 1),
                                          fontSize: 15),
                                    ),
                                  ],
                                )
                              ],
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
