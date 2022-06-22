import 'package:flutter/material.dart';
import 'package:Comchop/Tabbar_screens/activeOrders.dart';
import 'package:Comchop/Tabbar_screens/dashboard.dart';
import 'package:Comchop/Tabbar_screens/orders.dart';
import 'package:Comchop/Tabbar_screens/profile.dart';
import 'package:Comchop/categories/categories.dart';
import 'package:Comchop/provider/cartprovider.dart';
import 'package:provider/provider.dart';
import 'package:pusher_client/pusher_client.dart';

class tabbar extends StatefulWidget {
  final latitude;
  final longtitude;
  final address;

  tabbar({Key? key, this.latitude, this.longtitude, this.address})
      : super(key: key);

  @override
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  late String address = widget.address;
  int _currentIndex = 0;
  final List<Widget> _children = [
    dashboard_screen(),
    categories(),
    Activeorders(),
    Profile(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        backgroundColor: Color.fromRGBO(230, 231, 232, 10),
        selectedItemColor: Color.fromRGBO(252, 186, 24, 1),
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 10,
        unselectedFontSize: 8,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
