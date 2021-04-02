import 'package:flutter/material.dart';
import 'package:getmech/services/orderService.dart';
import 'package:getmech/utils/dialog.dart';

class VerifyPinPage extends StatefulWidget {
  final String orderId;
  VerifyPinPage({this.orderId});

  @override
  _VerifyPinPageState createState() => _VerifyPinPageState();
}

class _VerifyPinPageState extends State<VerifyPinPage> {

  void goBack(){
    Navigator.of(context).pop();
     Navigator.of(context).pop();
  }
  void goBackW(){
    Navigator.of(context).pop();
  }

  void validate()async{
    bool res = await  OrderService().veriyPin(widget.orderId, _pin.text.trim());
    if(res){
     await OrderService().pinVerifiedStatus(widget.orderId);   
      DialogUtil().showTaskDoneDialog(context, "Start PIn Verified", "", true, goBack);
    }else{
      DialogUtil().showTaskDoneDialog(context, "Wrong PIN", "Please take correct pin from user", false, goBackW);
    }
  }


@override
void initState() { 
  super.initState();
  print(widget.orderId);
}

    TextEditingController _pin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter verifiaction pin"),
      ),
      body: Column(
        children: [
          Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _pin,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'START PIN',
                    ),
                  ),
                ),
          Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[600],
                          onPrimary: Colors.white,
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: validate)),
        ]
      ),
      
    );
  }
}