import 'package:flutter/material.dart';
import 'package:Comchop/checkout_screens/checkout_order_screen.dart';

class see_featured_partner_screen extends StatelessWidget {
  const see_featured_partner_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Text('San Francisco',
                style: TextStyle(color: Colors.black, fontSize: 22)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child:
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>checkout_order_screens()),
                  );
                },
                  child: Image.asset( 'images/carticon.png')),
            ),
          )
        ],

        centerTitle: true,

        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: GridView.builder(

            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180,
                childAspectRatio: 3 / 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
            ),
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (BuildContext ctx, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 220,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/tacos.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.10), BlendMode.darken),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_alarm,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            '25min',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_alarm,
                                color: Colors.white,
                                size: 15,
                              ),
                              Text(
                                'Free',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                              height: 25,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                '25min',
                                style: TextStyle(color: Colors.white),
                              ))),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('McDonald'),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Chinese',
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'American',
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
