import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';

import 'mechanicMain.dart';

class LoginMechanic extends StatefulWidget {
  @override
  _LoginMechanicState createState() => _LoginMechanicState();
}

class _LoginMechanicState extends State<LoginMechanic> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Login-Mechanic'),
        ),
        body: Padding(
            padding: EdgeInsets.all(50),
            child: ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Phone Number',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter your Password",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("Forgot Password?",
                        style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Click here',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  child: Text('LOGIN'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MechanicMainPage()),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("Dont have an account?",
                        style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Register here',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
