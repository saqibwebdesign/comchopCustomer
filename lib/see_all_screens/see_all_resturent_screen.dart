
import 'package:flutter/material.dart';


class see_all_resturent_screen extends StatelessWidget {
  const see_all_resturent_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'images/sliderone.png',
      'images/slidertwo.png',


    ];
    final List<String> categories = [
      'images/burger.png',
      'images/burger.png',
      'images/burger.png',
      'images/burger.png',

    ];
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
                  child: Text(
                    'Filter',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
            )
          ],
          centerTitle: true,

          elevation: 0.0,
        ),
      body: SafeArea(
        child: SingleChildScrollView(

          child: Container(

            padding: EdgeInsets.only(left: 10,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:images.length,
                  itemBuilder: (BuildContext context, int index)=>
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        width: 335,
                        height: 282,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(images[index]),
                            SizedBox(height: 10,),
                            Text( 'McDonald  ' ,style: TextStyle(color: Colors.black,fontSize: 20),),
                            SizedBox(height: 5,),
                            Row(

                              children: [
                                Text( '\$\$',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Text( '.',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Text( 'Chinese',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Text( '.',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Text( 'American',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Text( '.',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Text( 'Deshi food',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),

                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(

                              children: [
                                Text( '4.3 ',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Icon(Icons.star,size: 11,color: Color.fromRGBO(252, 186, 24, 1),),
                                SizedBox(width: 5,),
                                Text( '200+ Ratings',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Icon(Icons. access_alarm_rounded,size: 11,),
                                SizedBox(width: 5,),
                                Text( '25 Min',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),
                                SizedBox(width: 5,),
                                Icon(Icons.person     ,size: 11,color: Color.fromRGBO(134, 134, 134, 1),),
                                SizedBox(width: 5,),
                                Text( 'Free',style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: 14,fontWeight: FontWeight.w400),),

                              ],
                            )
                          ],
                        ),
                      ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Type of Foods',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        ' See all',
                        style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:categories.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(categories[index]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Burgers (120)',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Restaurants',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        ' See all',
                        style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 254,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.all(5),
                      width: 200,
                      height: 254,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(images[index]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' Daylight Coffee',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Colarodo, San Francisco',
                            style: TextStyle(
                                color: Color.fromRGBO(134, 134, 134, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 20,
                                  width: 36,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(252, 186, 24, 1),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                      child: Text(
                                        '4.5',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '25min',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                      134,
                                      134,
                                      134,
                                      1,
                                    ),
                                    fontSize: 10),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Free delivery'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )



    );
  }
}
