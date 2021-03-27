import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/registerProduct.dart';
import 'package:getmech/utils/constants.dart';

import 'internalPages/mechProfile/mechProfile.dart';

class RegisterService extends StatefulWidget {
  @override
  _RegisterServiceState createState() => _RegisterServiceState();
}

class _RegisterServiceState extends State<RegisterService> {
  TextEditingController servicenameController = TextEditingController();
  TextEditingController chargesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Add Service'),
        ),
        body: Padding(
            padding: EdgeInsets.all(50),
            child: ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: servicenameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Service Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: chargesController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Service Charges',
                    prefix: Text("Rs. "),
                  ),
                ),
              ),
              Container(
                  child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      height: 65,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: primaryColor,
                        child: Text(
                          'Add Services',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          print(servicenameController.text);
                          print(chargesController.text);
                        },
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Do you Sell Spare Products ?",
                  style: TextStyle(
                    fontSize: 18,
                    color: textPrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                child: ViewWidget(),
              ),
            ])));
  }
}

class ViewWidget extends StatefulWidget {
  @override
  ViewWidgetState createState() => ViewWidgetState();
}

class ViewWidgetState extends State {
  bool viewVisible = false;

  get gstNumberController => null;

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('YES'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterProduct()),
                );
              },
            ),
            ElevatedButton(
              child: Text('NO'),
              onPressed: showWidget,
            ),
          ],
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: viewVisible,
          child: Container(
              padding: EdgeInsets.all(10),
              height: 65,
              // ignore: deprecated_member_use
              child: RaisedButton(
                textColor: Colors.white,
                color: primaryColor,
                child: Text(
                  'Register Here',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MechProfile()),
                  );
                },
              )),
        ),
      ],
    );
  }
}
