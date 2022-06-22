import 'package:flutter/material.dart';

class thankyou_screen extends StatelessWidget {
  final totalincvat;
  const thankyou_screen({Key? key, this.totalincvat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'Estimated delivery time',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          )),
          SizedBox(
            height: 5,
          ),
          Center(
              child: Text(
            '30 - 40 mins',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          )),
          SizedBox(
            height: 5,
          ),
          Center(
              child: Image.network(
            "https://comchop.com/public/app/icon/rider.png",
          )),
          SizedBox(
            height: 18,
          ),
          Center(
            child: Text(
              'Thanks for Your Order',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Card(
            elevation: 1,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 80,
                width: 350,
                decoration: new BoxDecoration(
                    color: Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Paid with',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                "https://comchop.com/public/app/icon/cashondelivery.png"),

                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Cash on delivery',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Text(
                          '\$123',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
