import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/mechanicMain.dart';
import 'package:getmech/utils/constants.dart';
import 'internalPages/mechProfile/mechProfile.dart';

class RegisterProduct extends StatefulWidget {
  @override
  _RegisterProductState createState() => _RegisterProductState();
}

class _RegisterProductState extends State<RegisterProduct> {
  TextEditingController productnameController = TextEditingController();
  TextEditingController costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Add Product'),
        ),
        body: Padding(
            padding: EdgeInsets.all(50),
            child: ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: productnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: costController,
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
                          'Add Products',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          print(productnameController.text);
                          print(costController.text);
                        },
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
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
                          'Register Here',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MechanicMainPage()),
                          );
                        },
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
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
                          'Skip',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MechanicMainPage()),
                          );
                        },
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
            ])));
  }
}
