import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Comchop/details_screen/details_screen_product.dart';
import 'package:Comchop/details_screen/product.dart';
import 'package:Comchop/see_all_screens/see_all_resturent_screen.dart';

class dashboardwidget {
  fyp(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: 335,
          child: Image.asset('images/Banner.png'),
        ),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.only(right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Picks ',
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
        SizedBox(
          height: 15,
        ),
        Text(
          ' Restaurants by team',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsets.all(5),
              width: 200,
              height: 254,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images[index]'),
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
        Container(
          padding: EdgeInsets.only(right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Restaurants',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => see_all_resturent_screen()),
                  );
                },
                child: Text(
                  ' See all',
                  style: TextStyle(
                    color: Color.fromRGBO(252, 186, 24, 1),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  productcard(BuildContext context, img, title) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsets.all(5),
              width: 200,
              height: 254,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(img),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
        Container(
          padding: EdgeInsets.only(right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Restaurants',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => see_all_resturent_screen()),
                  );
                },
                child: Text(
                  ' See all',
                  style: TextStyle(
                    color: Color.fromRGBO(252, 186, 24, 1),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cicularbar() {
    return SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(
          color: Color.fromRGBO(252, 186, 24, 1),
          backgroundColor: Colors.white,
          strokeWidth: 3,
        ));
  }
}
