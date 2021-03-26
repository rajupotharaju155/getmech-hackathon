import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CommonActions{
  static gotoPage(Widget page, BuildContext context){
    Navigator.push(context, PageTransition(child: page, type: PageTransitionType.rightToLeft));
  }
}