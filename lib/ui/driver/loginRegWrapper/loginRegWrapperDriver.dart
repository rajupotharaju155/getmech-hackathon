
import 'package:flutter/material.dart';
import 'package:getmech/ui/driver/loginRegWrapper/loginDriver.dart';
import 'package:getmech/ui/driver/loginRegWrapper/registerDriver.dart';

// ignore: must_be_immutable
class LoginRegWrapperDriver extends StatefulWidget {
  @override
  _LoginRegWrapperDriverState createState() => _LoginRegWrapperDriverState();
}

class _LoginRegWrapperDriverState extends State<LoginRegWrapperDriver> {
  bool goToLogin = true;

  void gotoLogin(){
    setState(() {
      goToLogin = true;
    });
  }

  void gotoReg(){
    setState(() {
      goToLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(goToLogin){
      return LoginDriver(transition: gotoReg );
    }else{
      return RegisterDriver(transition: gotoLogin);
      // print("Page not found");
    }
  }
}