import 'package:flutter/material.dart';
import 'package:getmech/ui/driver/driverMain.dart';
import 'package:getmech/ui/mechanic/mechanicMain.dart';
import 'package:getmech/utils/commonActions.dart';

class WrapperPage extends StatefulWidget {

  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  void _gotoMechanicPage(){
    CommonActions.gotoPage(MechanicMainPage(), context);
  }

  void _gotoDriverPage(){
    CommonActions.gotoPage(DriverMainPage(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: ElevatedButton(
                onPressed: _gotoMechanicPage, 
                child: Text("I am Mechanic")),
            ),
            Container(
              child: ElevatedButton(
                onPressed: _gotoDriverPage, 
                child: Text("I am Driver")),
            ),
          ],
        )
      ),
      
    );
  }
}