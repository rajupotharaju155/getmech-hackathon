import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/internalPages/history.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile.dart';
import 'package:getmech/ui/mechanic/internalPages/newOrders.dart';
import 'package:getmech/utils/constants.dart';

import 'internalPages/settings.dart';

class MechanicMainPage extends StatefulWidget {
  @override
  _MechanicMainPageState createState() => _MechanicMainPageState();
}

class _MechanicMainPageState extends State<MechanicMainPage> {
    int _page = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _navChildren = [
            NewOrders(),
            MechProfile(),
            Histpry(),
            MechSettings()
          ];

    return Scaffold(
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
          Icon(Icons.add_alert, 
            color: kBackgroundColor,),
          
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