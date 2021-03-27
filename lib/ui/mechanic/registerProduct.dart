import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';
import 'internalPages/mechProfile/mechProfile.dart';

class RegisterProduct extends StatefulWidget {
  @override
  _RegisterProductState createState() => _RegisterProductState();
}

class _RegisterProductState extends State<RegisterProduct> {
  TextEditingController servicenameController = TextEditingController();
  TextEditingController chargesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Add Product'),
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
                    labelText: 'Product Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: chargesController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefix: Text("Rs. "),
                    labelText: "Unit Price",
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
                          'Complete Registration',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          print(servicenameController.text);
                          print(chargesController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MechProfile()),
                          );
                        },
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ])));
  }
}
