import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getmech/ui/wrapper/wrapper.dart';
import 'package:getmech/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: BaseWrapper(),
    );
  }
}

class BaseWrapper extends StatefulWidget {
  @override
  _BaseWrapperState createState() => _BaseWrapperState();
}

class _BaseWrapperState extends State<BaseWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
          else if (snapshot.hasData) {
            User user = snapshot.data;
            return CheckIfUserIsDriverOrMechanic(uid: user.uid);
          } else
            return WrapperPage();
        });
  }
}
