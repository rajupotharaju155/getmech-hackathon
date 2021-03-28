import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/orderModel.dart';
import 'package:getmech/utils/constants.dart';
import 'package:intl/intl.dart';
class MechanicHistory extends StatefulWidget {
      final bool isDriver;
  MechanicHistory({this.isDriver});
  @override
  _MechanicHistoryState createState() => _MechanicHistoryState();
}

class _MechanicHistoryState extends State<MechanicHistory> {
  final DateFormat formatter = DateFormat('dd-MMM-yyyy');
  List<OrderModel> orderList = [
    OrderModel(
      orderName: "Tyre Puncture",
      vehicleName: "Toyota Innova",
      vehicleClassNumber: 4,
      orderDate:  DateTime.now(),
      totalCost: 450,
      wasSuccess: true,
    ),
    OrderModel(
      orderName: "Accessories",
      vehicleName: "Suzuki DZire",
      vehicleClassNumber: 4,
      orderDate:  DateTime.now(),
      totalCost: 450,
      wasSuccess: false,
    ),
    OrderModel(
      orderName: "Tyre Puncture",
      vehicleName: "Splender Plus",
      vehicleClassNumber: 2,
      orderDate:  DateTime.now(),
      totalCost: 450,
      wasSuccess: true,
    ),
    OrderModel(
      orderName: "Tyre Puncture",
      vehicleName: "KTM",
      orderDate:  DateTime.now(),
      vehicleClassNumber: 2,
      totalCost: 450,
      wasSuccess: false,
    ),
    OrderModel(
      orderName: "Tyre Puncture",
      vehicleName: "Eicher Force",
      vehicleClassNumber: 6,
      orderDate:  DateTime.now(),
      totalCost: 450,
      wasSuccess: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Order History'),
        ),
        body: ListView.builder(
          itemCount: orderList.length,
          itemBuilder: (context, index){
            
            final String formattedDate = formatter.format(orderList[index].orderDate);
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
                              Text(orderList[index].orderName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius:BorderRadius.circular(10)
                                ),
                                child: Text(orderList[index].vehicleClassNumber.toString() + " W",
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
                          Text(orderList[index].vehicleName,
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
                                child: Text(orderList[index].wasSuccess? "Success" : "Cancelled",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: orderList[index].wasSuccess?  Colors.green : Colors.red
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
          })
        
        );
  }
}
