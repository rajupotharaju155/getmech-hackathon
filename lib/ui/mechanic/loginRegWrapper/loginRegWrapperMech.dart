
import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/loginRegWrapper/loginMechanic.dart';
import 'package:getmech/ui/mechanic/loginRegWrapper/registerMechanic.dart';
// ignore: must_be_immutable
class LoginRegWrapperMech extends StatefulWidget {
  @override
  _LoginRegWrapperMechState createState() => _LoginRegWrapperMechState();
}

class _LoginRegWrapperMechState extends State<LoginRegWrapperMech> {
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
      return LoginMechanic(transition: gotoReg );
    }else{
      return RegisterMechanic(transition: gotoLogin);
    }
  }
}