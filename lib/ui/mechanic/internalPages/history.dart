import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';

class MechanicHistory extends StatefulWidget {
  @override
  _MechanicHistoryState createState() => _MechanicHistoryState();
}

class _MechanicHistoryState extends State<MechanicHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Work History'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: kDisabledColor))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //pic
                    Expanded(
                      flex: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kDisabledColor)),
                          child: Icon(
                            Icons.receipt_long_outlined,
                            size: 140.00,
                          )),
                    ),
                    //name
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Service Provided",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Details/Date/Location/",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25,
                                    color: textPrimaryColor),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      "Status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.green[800]),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.arrow_right,
                                      color: Colors.green[800],
                                      size: 50.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    )
                  ],
                )),
            SizedBox(height: 6),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: kDisabledColor))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //pic
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: kDisabledColor)),
                        child: Icon(
                          Icons.receipt_long_outlined,
                          size: 140.00,
                        ),
                      ),
                    ),
                    //name
                    Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Service Provided",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Details/Date/Location/",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 25,
                                    color: textPrimaryColor),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      "Status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.green[800]),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.arrow_right,
                                      color: Colors.green[800],
                                      size: 50.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    )
                  ],
                )),
          ]),
        ));
  }
}
