import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/orderModel.dart';
import 'package:getmech/models/mechanic/orderRequestmodel.dart';
import 'package:getmech/services/authService.dart';
import 'package:getmech/services/orderService.dart';
import 'package:getmech/ui/mechanic/internalPages/newOrder/detailedOrder.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewOrders extends StatefulWidget {
  @override
  _NewOrdersState createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {
  String garageId;
  final DateFormat formatter = DateFormat('dd-MMM-yyyy hh:mm:a');

  final List<OrderRequestModel> orderRequestList = [
    OrderRequestModel(
      orderName: "Tyre Puncture",
      requestDate: DateTime.now(),
      isUrgent: true,
      googleMapsUrl: "maps.gle.com",
      vehicleClassNumber: 4,
      vehicleName: "Toyota Innova Crysta",
      vehicleImageUrl: "random image url",
      requestStatus: "pending",
      vehicleColor: "red",
      registrationNumber: "MH 02 AX 1198",
      totalCost: 4500,
      paymentIsOnline: true,
      particularList: [
        Particulars(
          particularName: "WindShield",
          pirce: 1240,
          quantity: 1,
          isProduct: true
        ),
        Particulars(
          particularName: "MRF Tyre",
          pirce: 2000,
          quantity: 2,
          isProduct: true
        ),
        Particulars(
          particularName: "General Servicing",
          pirce: 1240,
          quantity: 1,
          isProduct: false
        ),
        Particulars(
          particularName: "OIl Change",
          pirce: 320,
          quantity: 2,
          isProduct: true
        ),
        Particulars(
          particularName: "General Servicing",
          pirce: 1240,
          quantity: 1,
          isProduct: false
        ),
        Particulars(
          particularName: "OIl Change",
          pirce: 320,
          quantity: 2,
          isProduct: true
        ),
        Particulars(
          particularName: "General Servicing",
          pirce: 1240,
          quantity: 1,
          isProduct: false
        ),
        Particulars(
          particularName: "OIl Change",
          pirce: 320,
          quantity: 2,
          isProduct: true
        ),
      ]
    ),
    OrderRequestModel(
      orderName: "Wind Shield Damage",
      requestDate: DateTime.now(),
      isUrgent: false,
      scheduledDate: DateTime.now(),
      googleMapsUrl: "maps.gle.com",
      vehicleClassNumber: 4,
      vehicleName: "Maruti Suzuki Swift",
      vehicleImageUrl: "random image url",
      requestStatus: "accepted",
      vehicleColor: "green",
      registrationNumber: "MH 02 AX 1198",
      totalCost: 4500,
      paymentIsOnline: false,
      particularList: [
        Particulars(
          particularName: "WindShield",
          pirce: 1240,
          quantity: 1,
          isProduct: true
        ),
        Particulars(
          particularName: "MRF Tyre",
          pirce: 2000,
          quantity: 2,
          isProduct: true
        ),
        Particulars(
          particularName: "General Servicing",
          pirce: 1240,
          quantity: 1,
          isProduct: false
        ),
        Particulars(
          particularName: "OIl Change",
          pirce: 320,
          quantity: 2,
          isProduct: true
        ),
      ]
    ),
    OrderRequestModel(
      orderName: "Engine Failure",
      requestDate: DateTime.now(),
      isUrgent: false,
      googleMapsUrl: "maps.gle.com",
      vehicleClassNumber: 2,
      vehicleName: "Bajaj Pulsar 220",
      vehicleImageUrl: "random image url",
      requestStatus: "pending",
      vehicleColor: "white",
      registrationNumber: "MH 02 AX 1198",
      totalCost: 4500,
      paymentIsOnline: true,
      particularList: [
        Particulars(
          particularName: "WindShield",
          pirce: 1240,
          quantity: 1,
          isProduct: true
        ),
        Particulars(
          particularName: "MRF Tyre",
          pirce: 2000,
          quantity: 2,
          isProduct: true
        ),
        Particulars(
          particularName: "General Servicing",
          pirce: 1240,
          quantity: 1,
          isProduct: false
        ),
        Particulars(
          particularName: "OIl Change",
          pirce: 320,
          quantity: 2,
          isProduct: true
        ),
      ]
    ),
    OrderRequestModel(
      orderName: "Tyre Puncture",
      requestDate: DateTime.now(),
      isUrgent: true,
      googleMapsUrl: "maps.gle.com",
      vehicleClassNumber: 4,
      vehicleName: "Toyota Innova Crysta",
      vehicleImageUrl: "random image url",
      requestStatus: "pending",
      vehicleColor: "grey",
      registrationNumber: "MH 02 AX 1198",
      totalCost: 4500,
      paymentIsOnline: true,
      particularList: [
        Particulars(
          particularName: "WindShield",
          pirce: 1240,
          quantity: 1,
          isProduct: true
        ),
        Particulars(
          particularName: "MRF Tyre",
          pirce: 2000,
          quantity: 2,
          isProduct: true
        ),
        Particulars(
          particularName: "General Servicing",
          pirce: 1240,
          quantity: 1,
          isProduct: false
        ),
        Particulars(
          particularName: "OIl Change",
          pirce: 320,
          quantity: 2,
          isProduct: true
        ),
      ]
    ),
  ];

  void _detailedOrder(BuildContext context, OrderRequestModel orderreqModel){
    // print("More details"+ orderName);
    CommonActions.gotoPage(DetailedOrder(orderRequestModel: orderreqModel,), context);
  }

    void _logout()async{
   bool result = await AuthService().logOut();
   if(result){
    //  Navigator.of(context).pop();
    print("Suvvesfully loged out");
   }else{
     print("Problem in logginf out");
   }
  }

  @override
  void initState() { 
    super.initState();
    garageId = AuthService().currrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Orders"),
        actions: [
          ElevatedButton(onPressed: _logout, child: Text("Logout"))
        ]
        
      ),
      body:  StreamBuilder<List<OrderRequestModel>>(
        stream: OrderService().allOrderListOfGarage(garageId),
        builder: (context, snapshot) {
           if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            List<OrderRequestModel> orderRequestList = snapshot.data;
          return ListView.builder(
              itemCount: orderRequestList.length,
              itemBuilder: (context, index){
                final String formattedDate = formatter.format(orderRequestList[index].requestDate);
                final String timeAgo = timeago.format(orderRequestList[index].requestDate);
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200]
                  ),
                  child: Column(
                    children: [
                      //pro pic and name
                Container(
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //pic
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kDisabledColor)
                          ),
                          child: FlutterLogo(
                            size: 100,
                          )
                        ),
                      ),
                      //name
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      // width: 100,
                                      child: Text(orderRequestList[index].orderName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                                    decoration: BoxDecoration(
                                      // color: Colors.purple,
                                      color: secondaryColor,
                                      borderRadius:BorderRadius.circular(10)
                                    ),
                                    child: Text(orderRequestList[index].vehicleClassNumber.toString() + " W",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1),
                              Text(orderRequestList[index].vehicleName,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              ),
                              Container(
                                height: 2,
                                color: Colors.grey[300],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.watch_later_outlined, color: Colors.grey[600], size: 18,),
                                  SizedBox(width: 4,),
                                  Text(timeAgo,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.grey[600]
                                  ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                child: Text(orderRequestList[index].requestStatus.toUpperCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: 
                                  orderRequestList[index].requestStatus == 'pending'? 
                                     primaryColor : 
                                  orderRequestList[index].requestStatus == 'accepted'? 
                                    Colors.green :
                                  orderRequestList[index].requestStatus == 'completed'? 
                                 Colors.blue[700] : Colors.red
                                ),
                                ),
                              )
                            ],
                          )
                        ),
                      )
                    ],
                  )
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.symmetric(vertical:5),
                          decoration: BoxDecoration(
                            color: 
                            orderRequestList[index].isUrgent?
                             primaryColor.withOpacity(0.1) : Colors.green.withOpacity(0.1),
                            border: Border.all(color: 
                            orderRequestList[index].isUrgent?
                             primaryColor : Colors.green),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              orderRequestList[index].isUrgent?
                              Icon(Icons.warning_amber_sharp, color: primaryColor, size: 22,)
                              : Icon(Icons.watch_later_outlined, color: secondaryColor, size: 22)
                              ,
                              Text(
                                orderRequestList[index].isUrgent?
                                "Urgent!".toUpperCase() : "Scheduled".toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                                color: 
                                orderRequestList[index].isUrgent?
                                 primaryColor: Colors.green[900]
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: ElevatedButton(
                          onPressed:()=> _detailedOrder(context, orderRequestList[index]), 
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor, // background
                              onPrimary: Colors.white, // foreground
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                          child: Container(
                            padding: EdgeInsets.all(5),
                             height: 40,
                            child: Center(
                              child: Text("View"),
                            ),
                          )),
                      )
                    ],
                  ),
                ),
                    ],
                  )
                );  
              });
          }
        }
      ),
      
    );
  }
}