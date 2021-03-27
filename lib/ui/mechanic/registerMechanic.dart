import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';

class RegisterMechanic extends StatefulWidget {
  @override
  _RegisterMechanicState createState() => _RegisterMechanicState();
}

class _RegisterMechanicState extends State<RegisterMechanic> {
  TextEditingController garagenameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Mechanic Registeration'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: garagenameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Garage Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Garage Address',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Do you have a GST Number ?",
                  style: TextStyle(
                    fontSize: 18,
                    color: textPrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Radiobutton(),
              ),
              Container(
                padding: EdgeInsets.all(10),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
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
                          'REGISTER',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          print(garagenameController.text);
                          print(passwordController.text);
                        },
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ])));
  }
}

class Radiobutton extends StatefulWidget {
  @override
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State {
  String radioItem = '';

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          groupValue: radioItem,
          title: Text('YES'),
          value: 'yes',
          onChanged: (val) {
            setState(() {
              radioItem = val;
            });
          },
        ),
        RadioListTile(
          groupValue: radioItem,
          title: Text('NO'),
          value: 'no',
          onChanged: (val) {
            setState(() {
              radioItem = val;
            });
          },
        ),
      ],
    );
  }
}
