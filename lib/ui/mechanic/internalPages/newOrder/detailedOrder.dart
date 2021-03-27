import 'package:intl/intl.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/orderModel.dart';
import 'package:getmech/models/mechanic/orderRequestmodel.dart';
import 'package:getmech/utils/constants.dart';

class DetailedOrder extends StatelessWidget {
  final OrderRequestModel orderRequestModel;

   DetailedOrder({this.orderRequestModel});
  DateFormat formatter = DateFormat('dd-MMM-yyyy hh:mm:a');
  void _call(String number){
    print(number);
  }

  void acceptOrder(){
    print("Accept");
  }
  void _cancelOrder(){
    print("Cancel");
  }

  void _goToVerifyPin(){
    print("Veryfing PIN");
  }
  @override
  Widget build(BuildContext context) {
    final String formattedDate = orderRequestModel.scheduledDate != null?  formatter.format(orderRequestModel.scheduledDate): "";
    return Scaffold(
      appBar: AppBar(
        title: Text(orderRequestModel.orderName),
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
                color: orderRequestModel.isUrgent? primaryLightColor.withOpacity(0.4) : Colors.green[200],
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: orderRequestModel.isUrgent?
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
                      Text(orderRequestModel.vehicleName,
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
                        child: Text(orderRequestModel.vehicleClassNumber.toString() + " W",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Text(orderRequestModel.vehicleColor.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                  ),
                  Text(orderRequestModel.registrationNumber,
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
                  Text(orderRequestModel.orderName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                  Column(
                    children: List.generate(
                    orderRequestModel.particularList.length,
                    (index){
                      Particulars partList = orderRequestModel.particularList[index];
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
                trailing: Text("Rs. "+orderRequestModel.totalCost.toString(),
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
                  orderRequestModel.paymentIsOnline? "Online": "Cash",
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
              orderRequestModel.requestStatus == 'pending'?
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