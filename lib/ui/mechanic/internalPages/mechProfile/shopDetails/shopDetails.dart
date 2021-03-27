import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class ShopDetails extends StatefulWidget {
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  bool shopStatus = true;

  Map<String, bool> workingDays = {
    'monday': true,
    'tuesday': false,
    'wednesday': false,
    'thursday': false,
    'fridayday': false,
    'saturday': false,
    'sunday': true,
  };

  void _saveSettings(){
    print("saving");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Details"),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            //current shop status
            Card(
              child:  Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(color: Colors.white),
              child: ListTile(
                title: Text("Current Shop Status",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
                ),
                // subtitle: Text("Enabling this service will send sms to your emergency contacts"),
                trailing: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LiteRollingSwitch(
                    //initial value
                    value: shopStatus,
                    textOn: 'OPEN',
                    textOff: 'CLOSE',
                    colorOn: Colors.greenAccent[700],
                    colorOff: Colors.redAccent[700],
                    iconOn: Icons.done,
                    iconOff: Icons.remove_circle_outline,
                    textSize: 12.0,
                    onChanged: (bool state) {
                      print('Current State of SWITCH IS: $state');
                    },
                  ),
                ),
              ),
            ),
            ),
            //working
            Card(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(height: 34, width: 5, color: secondaryColor,),
                        SizedBox(width: 5,),
                        Text("Working Days",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        )
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: secondaryColor.withOpacity(0.7)),
                  Column(
                    children: workingDays.keys.map((e){
                      return CheckboxListTile(
                        // activeColor: secondaryColor,
                        // checkColor: Colors.white,
                          title: Text(e.toUpperCase()),
                          value: workingDays[e],
                          onChanged: (newValue) {
                            setState(() {
                              workingDays[e] = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        );
                    }).toList(),
                  ),
                ],
              ),
            ),

            //working hours
            Card(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(height: 34, width: 5, color: secondaryColor,),
                        SizedBox(width: 5,),
                        Text("Working Hours",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        )
                        )
                      ],
                    ),
                  ),
                   Divider(thickness: 1, color: secondaryColor.withOpacity(0.7)),
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: Text("9AM to 8PM",
                    style: TextStyle(
                      fontSize: 22
                    ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 50,
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green[700],
            onPrimary: Colors.white
          ),
          onPressed: _saveSettings, 
          child: Center(
            child: Text("SAVE",),
          )),
      ),
      
    );
  }
}