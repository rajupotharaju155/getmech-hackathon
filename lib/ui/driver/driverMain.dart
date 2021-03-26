import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:getmech/ui/driver/internalPages/driverHomePage.dart';
import 'package:getmech/ui/driver/internalPages/driverProfile.dart';
import 'package:getmech/ui/driver/internalPages/history.dart';
import 'package:getmech/ui/driver/internalPages/settings.dart';
import 'package:getmech/utils/constants.dart';

class DriverMain extends StatefulWidget {
  @override
  _DriverMainState createState() => _DriverMainState();
}

class _DriverMainState extends State<DriverMain> {
  int _page = 0;
  final List<Widget> _navChildren = [
    DriverHomePage(),
    DriverHistory(),
    DriverProfile(),
    DriverSettings(),
  ];
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // appBar: AppBar(
      //   title: Text("Mechanic Page")
      // ),
      body: IndexedStack(
        index: _page,
        children: _navChildren,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: [
          Icon(
            Icons.home_outlined,
            color: kBackgroundColor,
          ),
          Icon(Icons.contact_page_outlined, color: kBackgroundColor),
          Icon(Icons.person_outline, color: kBackgroundColor),
          Icon(
            Icons.settings_outlined,
            color: kBackgroundColor,
          ),
        ],
        index: 0,
        height: 60.0,
        color: primaryColor,
        backgroundColor: kBackgroundColor,
        buttonBackgroundColor: secondaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
