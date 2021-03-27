import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/registerService.dart';
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
  TextEditingController gstNumberController = TextEditingController();

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
                child: ViewWidget(),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Which all Vehicles you can repair  ?",
                  style: TextStyle(
                    fontSize: 18,
                    color: textPrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                child: CheckBox(),
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
                          'Go to Next Page',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          print(phoneNumberController.text);
                          print(passwordController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterService()),
                          );
                        },
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
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
              onPressed: showWidget,
            ),
            ElevatedButton(
              child: Text('NO'),
              onPressed: hideWidget,
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
            child: TextField(
              controller: gstNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your GST Number',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckBox extends StatefulWidget {
  @override
  CheckBoxWidget createState() => CheckBoxWidget();
}

class CheckBoxWidget extends State {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valuefourth = false;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(Icons.bike_scooter),
          title: const Text('TWO WHEELER'),
          value: this.valuefirst,
          onChanged: (bool value) {
            setState(() {
              this.valuefirst = value;
            });
          },
        ),
        CheckboxListTile(
          secondary: const Icon(Icons.car_repair),
          title: const Text('FOUR WHEELER'),
          value: this.valuesecond,
          onChanged: (bool value) {
            setState(() {
              this.valuesecond = value;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(Icons.bus_alert),
          title: const Text('BUS'),
          value: this.valuethird,
          onChanged: (bool value) {
            setState(() {
              this.valuethird = value;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(Icons.bus_alert),
          title: const Text('TRUCK'),
          value: this.valuefourth,
          onChanged: (bool value) {
            setState(() {
              this.valuefourth = value;
            });
          },
        ),
      ],
    );
  }
}
