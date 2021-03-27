import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/registerProduct.dart';
import 'package:getmech/utils/constants.dart';

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
            padding: EdgeInsets.all(10),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterProduct()),
                          );
                        },
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ])));
  }
}
