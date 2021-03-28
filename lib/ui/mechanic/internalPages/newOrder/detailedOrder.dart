import 'package:getmech/services/orderService.dart';
import 'package:getmech/utils/dialog.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/orderModel.dart';
import 'package:getmech/models/mechanic/orderRequestmodel.dart';
import 'package:getmech/utils/constants.dart';

class DetailedOrder extends StatefulWidget {
  final OrderRequestModel orderRequestModel;
  final bool isDriver;
   DetailedOrder({
     this.orderRequestModel, 
    @required this.isDriver});

  @override
  _DetailedOrderState createState() => _DetailedOrderState();
}

class _DetailedOrderState extends State<DetailedOrder> {
    ProgressDialog pd;
  final DateFormat formatter = DateFormat('dd-MMM-yyyy hh:mm:a');

  void _call(String number){
    print(number);
  }

  void goBack(){
      Navigator.of(context).pop();
      Navigator.of(context).pop();
  }

  void acceptOrder()async{
    print("Accept");
    pd.style(message: "Accepting order..");
    await pd.show();
    bool res = await OrderService().acceptOrder(widget.orderRequestModel.orderRequestId);
    pd.hide();
    if(res){
      DialogUtil().showTaskDoneDialog(
        context, "Order Accepted", 
        "Pelase Enter start PIN from user to confirm order", 
        true, goBack);
    }
  }

  void _cancelOrder(){
    print("Cancel");
  }

  void _goToVerifyPin(){
    print("Veryfing PIN");
  }

  @override
  void initState() { 
    super.initState();
    pd = ProgressDialog(context, isDismissible: false);
    print("order id " +widget.orderRequestModel.orderRequestId);
    print('Is driver is: '+ widget.isDriver.toString());
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = widget.orderRequestModel.scheduledDate != null?  formatter.format(widget.orderRequestModel.scheduledDate): "";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.orderRequestModel.orderName),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300]
            ),
            height: 150,
            child: FlutterLogo(size: 100,),
          ),
          //call navigate card
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      // color: Colors.green
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        onPrimary: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      onPressed:()=> _call("+9199876723123"), 
                      icon: Icon(Icons.call), 
                      label: Text("Call")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.all(2.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: secondaryColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      onPressed:()=> _call("+9199876723123"), 
                      icon: Icon(Icons.location_on_outlined), 
                      label: Text("Navigate",
                      )),
                  ),
                )
               
              ],
            ),
          ),
          
          //urgent or scheduled
          Card(
            shadowColor: Colors.grey[300],
            elevation: 2,
            color: Colors.grey[50],
            child: Container(
              decoration: BoxDecoration(
                color: widget.orderRequestModel.isUrgent? primaryLightColor.withOpacity(0.4) : Colors.green[200],
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: widget.orderRequestModel.isUrgent?
                Text("This is an urgent order!",
                style: TextStyle(
                  fontSize: 20
                ),
                ):
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("This is scheduled order",
                    style: TextStyle(
                      fontSize: 20
                    ),),
                    Text(formattedDate.toString())
                  ],
                )
            ),
          ),
          //vehicle details card
          Card(
            shadowColor: Colors.grey[300],
            elevation: 2,
            color: Colors.grey[50],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 4,
                          color: secondaryColor,
                          height: 30,
                        ),
                        SizedBox(width: 5,),
                        Text("Vehicle Details",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.orderRequestModel.vehicleName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                        decoration: BoxDecoration(
                          // color: Colors.purple,
                          color: secondaryColor,
                          borderRadius:BorderRadius.circular(10)
                        ),
                        child: Text(widget.orderRequestModel.vehicleClassNumber.toString() + " W",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Text(widget.orderRequestModel.vehicleColor.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  ),
                  Text(widget.orderRequestModel.registrationNumber,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  )

                ],
              ),
            ),
          ),

           //Complaint details card
          Card(
            shadowColor: Colors.grey[300],
            elevation: 2,
            color: Colors.grey[50],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 4,
                          color: secondaryColor,
                          height: 30,
                        ),
                        SizedBox(width: 5,),
                        Text("Complaint Details",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 2,),
                  Text(widget.orderRequestModel.orderName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                  Column(
                    children: List.generate(
                    widget.orderRequestModel.particularList.length,
                    (index){
                      Particulars partList = widget.orderRequestModel.particularList[index];
                      return ListTile(
                        title: Text(partList.particularName),
                        trailing: Container(
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              partList.isProduct?
                              Text(" X "+partList.quantity.toString()):
                              Container(),
                              // SizedBox(width: 10,),
                              Text("Rs."+ partList.pirce.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                              )
                            ]
                            
                          ),
                        ),
                      );
                    }),
                  ),
                  

                ],
              ),

            ),
          ),
          //total cost
          Card(
            shadowColor: Colors.grey[300],
            elevation: 2,
            color: Colors.grey[50],
            child: Container(
              child: ListTile(
                title: Text("Total Cost",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                trailing: Text("Rs. "+widget.orderRequestModel.totalCost.toString(),
                style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                ),
              )
            ),
          ),
          //payment method
          Card(
            shadowColor: Colors.grey[300],
            elevation: 2,
            color: Colors.grey[50],
            child: Container(
              child: ListTile(
                title: Text("Payment Method",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                trailing: Text(
                  widget.orderRequestModel.paymentIsOnline? "Online": "Cash",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
              )
            ),
          )

        ],
      ),
      bottomNavigationBar: Container(
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 5),
              alignment:  Alignment.topCenter,
              child: 
              !widget.isDriver ?
              widget.orderRequestModel.requestStatus == 'pending'?
              SliderButton(
                buttonSize: 40,
                height: 50,
                  action: acceptOrder,
                  dismissible: false,
                  ///Put label over here
                  label: Text(
                       "SWIPE TO ACCEPT",
                    style: TextStyle(
                        color: Color(0xff4a4a4a),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  icon: Center(
                      child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 30.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  )),

                  ///Change All the color and size from here.
                  width: MediaQuery.of(context).size.width,
                  radius: 10,
                  buttonColor:   Colors.green[600],
                  backgroundColor:  Colors.green[800],
                  highlightedColor:  Colors.green ,
                  baseColor: Colors.white ,
                ):
              
              //ask for Verification Pin
              Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.green[700],
                // border: Border.all(color: Colors.red[900]),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                onPressed: _goToVerifyPin,
                child: Center(
                  child: Text("Enter Verification Pin".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                ),
              ),
            ) :

            Container(
              child: widget.orderRequestModel.requestStatus == 'pending'?
              Container(
                color: primaryColor,
                child: Center(
                  child: Text("Waiting for garage to accept yout order",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),
                  ),
                ),
              ):
              widget.orderRequestModel.requestStatus == 'accepted'?
              Container(
                color: Colors.green,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("5423",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                      ),
                      Container(
                        height: 50,
                        width: 3,
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Request Accepted!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                          ),
                          Text("share this when you meet the mechanic",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ) : 
              widget.orderRequestModel.requestStatus == 'completed'?
              Container(
                height: 50,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("This order was completed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                    ),
                    Icon(Icons.check_box, color: Colors.white, size: 30,)
                  ],
                ),
              ): 
              Container(
                height: 50,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("This order was Cancelled",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                    ),
                    Icon(Icons.cancel_outlined, color: Colors.white, size: 30,)
                  ],
                ),
              )
            )
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: secondaryColor,
                // border: Border.all(color: Colors.red[900]),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                onPressed: _cancelOrder,
                child: Center(
                  child: Text("Cancel".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}