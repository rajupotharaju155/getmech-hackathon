import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';

class DriverHistory extends StatefulWidget {
  @override
  _DriverHistoryState createState() => _DriverHistoryState();
}

class _DriverHistoryState extends State<DriverHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Your History'),
      ),
      body: Center(
        child: Text(
            'You haven\'t used any service yet, Select any sevice from list if you need help'),
      ),
    );
  }
}
