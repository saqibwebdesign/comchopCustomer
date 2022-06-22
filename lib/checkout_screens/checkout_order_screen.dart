import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:Comchop/checkout_screens/add_your_payment%20_screen.dart';
import 'package:Comchop/checkout_screens/stepper.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/provider/cartprovider.dart';
import 'package:Comchop/widgets/dashboard_widget.dart';
import 'package:provider/provider.dart';

class checkout_order_screens extends StatelessWidget {
  final imgs;

  const checkout_order_screens({Key? key, this.imgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? selectedIndex;
    var remove = 0;
    var id;
    double subtotal = 0;
    final cart = Provider.of<api_calls>(context, listen: true);
    var userid;
    var resturentid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text('Cart', style: TextStyle(color: Colors.black, fontSize: 22)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: cart.get_cart(),
          builder: (c, AsyncSnapshot snap) {
            if (snap.connectionState == ConnectionState.waiting)
              return Center(child: dashboardwidget().cicularbar());

            if (!snap.hasData)
              return Align(
                  alignment: Alignment.center, child: Text('cart is empty'));
            if (snap.hasData) {
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snap.data['AllcartSRecords'].length,
                          itemBuilder: (ctx, index) {
                            print(snap.data['AllcartSRecords'][index]
                                ['variant_id']);
                            resturentid = snap.data['AllcartSRecords'][index]
                                ['restaurant_id'];
                            id = snap.data['AllcartSRecords'][index]['id'];
                            userid =
                                snap.data['AllcartSRecords'][index]['user_id'];
                            var price = snap.data['AllcartSRecords'][index]
                                    ['price'] *
                                snap.data['AllcartSRecords'][index]['quantity'];
                            var cartid =
                                snap.data['AllcartSRecords'][index]['id'];
                            var quantity =
                                snap.data['AllcartSRecords'][index]['quantity'];
                            subtotal = subtotal + price;
                            price = price;
                            return Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                    child: Text(
                                                  '${index + 1}',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          252, 186, 24, 1),
                                                      fontSize: 16),
                                                )),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                 
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  SizedBox(
                                                    width: 200,
                                                    child: Text(
                                                      '${snap.data['AllcartSRecords'][index]['prod']['description']}',
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            1, 15, 7, 1),
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            selectedIndex =
                                                                index;
                                                            cart.isdelete =
                                                                true;
                                                            print(
                                                                cart.cartvalue);
                                                            quantity == 1
                                                                ? null
                                                                : cart
                                                                    .update_cart(
                                                                        cartid,
                                                                        remove);
                                                            print('remove');
                                                          },
                                                          icon: cart.isdelete
                                                              ? dashboardwidget()
                                                                  .cicularbar()
                                                              : Icon(Icons
                                                                  .remove)),
                                                      Text(
                                                          '${snap.data['AllcartSRecords'][index]['quantity']}'),
                                                      IconButton(
                                                          onPressed: () {
                                                            cart.update_cart(
                                                                cartid, 1);

                                                            print('add');
                                                          },
                                                          icon:
                                                              Icon(Icons.add)),
                                                      Consumer<api_calls>(
                                                          builder: (context,
                                                              provider, child) {
                                                        return IconButton(
                                                            onPressed: () {
                                                              provider
                                                                  .delete_cart(
                                                                      id);
                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ));
                                                      }),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Divider(
                                            color:
                                                Color.fromRGBO(252, 186, 24, 1),
                                            thickness: 1.0,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    '\$' + '${price.toString()}',
                                    style: TextStyle(
                                        color: Color.fromRGBO(252, 186, 24, 1),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          }),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal'),
                          Text('\$${snap.data['sub_total']}'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total (incl. VAT)'),
                          Text('\$${snap.data['total']}'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                            height: 50,
                            width: 290,
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Color.fromRGBO(252, 186, 24, 1),
                                child: Text(
                                  'Continue (\$${snap.data['total']})',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          StepperDemo(
                                        id: id,
                                        paymentmethod: 'cod',
                                        resturent_id: resturentid,
                                        subtotal: {snap.data['total']},
                                        total_price: snap.data['sub_total'],
                                        userid: userid,
                                        vat_value: snap.data['Vat'],
                                      ),
                                    ),
                                  );
                                })),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (snap.hasError) print(snap.error.toString());
            return Align(
                alignment: Alignment.center,
                child: dashboardwidget().cicularbar());
          },
        ),
      ),
    );
  }
}
