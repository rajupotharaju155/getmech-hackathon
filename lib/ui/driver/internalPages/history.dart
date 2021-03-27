import 'package:flutter/material.dart';
import 'package:getmech/ui/driver/internalPages/garageDetails.dart';
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
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GarageDetails(),
                ),
              );
            },
            child: Card(
              elevation: 5.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/garage_1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Honda sevice center',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints.loose(Size.fromWidth(250)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Adding some random street address here!',
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text('27-Mar-2021'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
