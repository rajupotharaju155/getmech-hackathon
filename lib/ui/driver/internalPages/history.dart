import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/orderRequestmodel.dart';
import 'package:getmech/services/authService.dart';
import 'package:getmech/services/orderService.dart';
import 'package:getmech/ui/driver/internalPages/garageDetails.dart';
import 'package:getmech/utils/constants.dart';
import 'package:intl/intl.dart';

class DriverHistory extends StatefulWidget {
  final String uid;
  DriverHistory([this.uid]);
  @override
  _DriverHistoryState createState() => _DriverHistoryState();
}


class _DriverHistoryState extends State<DriverHistory> {
    final DateFormat formatter = DateFormat('dd-MMM-yyyy hh:mm:a');
String uid;

@override
void initState() { 
  super.initState();
  uid = AuthService().currrentUser(); 
}
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Your History'),
      ),
      body: StreamBuilder<List<OrderRequestModel>>(
        stream: OrderService().allOrderListOfUser(uid),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            List<OrderRequestModel> orderList = snapshot.data;
          return ListView.builder(
          itemCount: orderList.length,
          itemBuilder: (context, index){
             OrderRequestModel order = orderList[index];
            final String formattedDate = formatter.format(order.requestDate);
            return Container(
              child: Column(
                children: [
                  //pro pic and name
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kDisabledColor
                  )
                )
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
                              Text(order.garageName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius:BorderRadius.circular(10)
                                ),
                                child: Text(order.vehicleClassNumber.toString() + " W",
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
                          Text(order.vehicleName,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                          ),
                          Text(formattedDate,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey[600]
                          ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Text(order.requestStatus == 'pending'? "Pending" : "Success",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.green
                                ),
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )
                        ],
                      )
                    ),
                  )
                ],
              )
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
