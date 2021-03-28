import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getmech/models/mechanic/orderModel.dart';

class OrderRequestModel{
  final String orderRequestId;
  final String customerId;
  final String mechanichId;
  final String orderName;
  final DateTime requestDate;
  final DateTime scheduledDate;
  final bool isUrgent;
  final String googleMapsUrl;
  final int vehicleClassNumber;
  final String vehicleName;
  final String vehicleImageUrl;
  final List<Particulars> particularList;
  final String requestStatus;
  final String vehicleColor;
  final String registrationNumber;
  final double totalCost;
  final bool paymentIsOnline;

  OrderRequestModel({
    this.orderRequestId, 
    this.customerId, 
    this.mechanichId, 
    this.orderName, 
    this.requestDate, 
    this.scheduledDate,
    this.isUrgent, 
    this.googleMapsUrl, 
    this.vehicleClassNumber, 
    this.vehicleName, 
    this.vehicleImageUrl,
    this.particularList,
    this.requestStatus,
    this.vehicleColor,
    this.registrationNumber,
    this.totalCost,
    this.paymentIsOnline
    });


      //! get competetions list
  List<OrderRequestModel> ordersFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print(doc.reference.id);
      // print(doc.data()['MoneyDistributionStatus']);
      return OrderRequestModel(
          orderRequestId: doc.data()['orderRequestId'] ?? '',
           customerId: doc.data()['customerId'] ?? '',
          orderName: doc.data()['orderName'] ?? '',
          // competitionDocID: doc.reference.id ?? '',
          
          mechanichId: doc.data()['mechanichId'] ?? '',
          requestDate: doc.data()['requestDate'] ?? '',
          scheduledDate: doc.data()['scheduledDate'] ?? '',
          isUrgent: doc.data()['isUrgent'] ?? '',
          googleMapsUrl: doc.data()['googleMapsUrl'] ?? '',
          vehicleClassNumber: doc.data()['vehicleClassNumber'] ?? '',
          vehicleName: doc.data()['vehicleName'] ?? '',
          vehicleImageUrl: doc.data()['vehicleImageUrl'] ?? '',
          particularList: doc.data()['particularList'] ?? [],
          requestStatus: doc.data()['requestStatus'] ?? '',
          vehicleColor: doc.data()['vehicleColor'] ?? '',
          registrationNumber: doc.data()['registrationNumber'] ?? '',
          totalCost: doc.data()['totalCost'] ?? '',
          paymentIsOnline: doc.data()['paymentIsOnline'] ?? '',
          
          );
    }).toList();
  }
}