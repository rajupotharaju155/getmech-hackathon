import 'package:flutter/material.dart';
import 'package:getmech/ui/wrapper/wrapper.dart';
import 'package:getmech/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: customAppPrimary,
      ),
      home: WrapperPage(),
    );
  }
}
