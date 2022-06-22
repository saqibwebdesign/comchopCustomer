import 'package:flutter/material.dart';
import 'package:Comchop/checkout_screens/thankyou_screen.dart';
import 'package:Comchop/provider/api_calls.dart';
import 'package:Comchop/widgets/inherited_widget.dart';
import 'package:provider/provider.dart';

class order_complete_screen extends StatelessWidget {
  final editingcontroller;
  final orderid;
  final orderfrom;
  final deliveradrees;
  final totalincvat;

  const order_complete_screen(
      {Key? key,
      this.editingcontroller,
      this.orderid,
      this.orderfrom,
      this.deliveradrees,
      this.totalincvat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deliveryaddress = Provider.of<api_calls>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              elevation: 1.3,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 350,
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_location,
                                color: Color.fromRGBO(252, 186, 24, 1),
                              ),
                              Text(
                                'Delivery address',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.network(
                        "https://comchop.com/public/app/icon/map.png",
                      ),
                      Text(
                        '${deliveryaddress.locate}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Karachi',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: editingcontroller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                suffixStyle: TextStyle(color: Colors.grey),
                prefixStyle: TextStyle(color: Colors.grey),
                hintText: 'Add Special Instructions',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              elevation: 1,
              child: Center(
                child: Container(
                  //  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 360,
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Order Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your order number:',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '$orderid',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromRGBO(252, 186, 24, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              //  height: 100,
                              //     width: 100,
                              child: Text(
                                'Delivery address: ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                '${deliveryaddress.locate}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total (incl.vat): ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '\$$totalincvat',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
