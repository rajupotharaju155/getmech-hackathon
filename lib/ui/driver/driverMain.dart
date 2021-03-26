import 'package:flutter/material.dart';

class DriverMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Driver Page")),
      body: ListView(
        children: [
          Card(
            elevation: 5.0,
            child: Row(
              children: [
                Text(
                  'Honda sevice center',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
