import 'package:flutter/material.dart';
import 'package:getmech/ui/driver/driverMain.dart';
import 'package:getmech/ui/mechanic/mechanicMain.dart';
import 'package:getmech/ui/mechanic/register/registerMechanic.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';

class WrapperPage extends StatefulWidget {
  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  void _gotoMechanicPage() {
    CommonActions.gotoPage(MechanicMainPage(), context);
  }

  void _gotoDriverPage() {
    CommonActions.gotoPage(DriverMain(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
           Container(
             height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomLeft,
             child: Container(
              height: MediaQuery.of(context).size.height - 120,
              width: MediaQuery.of(context).size.width - 50,
              alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black45, BlendMode.darken),
                      image: AssetImage('assets/images/mech1.png'),
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
             ),
           ),
           Container(
             height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: secondaryColor.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    padding: EdgeInsets.symmetric(horizontal:10),
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome to,",
                    style: TextStyle(
                      backgroundColor: Colors.black45,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:10),
                    alignment: Alignment.centerLeft,
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "GetMech",
                          style: TextStyle(
                            backgroundColor: Colors.black45,
                            color: primaryColor,
                            fontSize: 45,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        TextSpan(
                          text: ".",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ]
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:10),
                    alignment: Alignment.centerLeft,
                    child: Text("One stop solution for all vehicles",
                    style: TextStyle(
                      backgroundColor: Colors.black45,
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                    ),
                  ),

                  //buttons
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal:10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: _gotoDriverPage, 
                                child: Center(
                                  child: Text("Lets Start")
                                )),
                            ),
                            GestureDetector(
                              onTap: _gotoMechanicPage,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal:10, vertical: 10),
                                alignment: Alignment.centerRight,
                                child: Text("Continue as Garage insted?",
                                style: TextStyle(
                                  backgroundColor: Colors.black45,
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                                 ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
           )
        ],
      )
    );
  }
}
