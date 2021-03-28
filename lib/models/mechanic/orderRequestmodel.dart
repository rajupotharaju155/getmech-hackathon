import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getmech/models/mechanic/orderModel.dart';

class OrderRequestModel{
  final String orderRequestId;
  final String customerId;
  final String garageId;
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
  final String garageAddress;
  final String garageName;

  OrderRequestModel({
    this.orderRequestId, 
    this.customerId, 
    this.garageId, 
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
    this.paymentIsOnline,
    this.garageAddress,
    this.garageName
    });


      //! get competetions list
  List<OrderRequestModel> ordersFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print(doc.reference.id);
      // print(doc.data()['MoneyDistributionStatus']);
      List<Particulars> partList = [];
      doc.data()['particularList'].forEach((e){
          Particulars part = Particulars(
            particularName: e['particularName'],
            isProduct: e['isProduct'],
            pirce: e['pirce'],
            quantity: e['quantity']

          );
          partList.add(part);
      });
      return OrderRequestModel(
          orderRequestId: doc.reference.id,
           customerId: doc.data()['customerId'] ?? '',
          orderName: doc.data()['orderName'] ?? '',
          garageAddress: doc.data()['garageAddress'] ?? '',
          garageName: doc.data()['garageName'] ?? '',
          garageId: doc.data()['garageId'] ?? '',
          requestDate: doc.data()['requestDate'].toDate() ?? '',
          scheduledDate: doc.data()['isUrgent'] == true? null : doc.data()['scheduledDate'].toDate(),
          isUrgent: doc.data()['isUrgent'] ?? '',
          googleMapsUrl: doc.data()['googleMapsUrl'] ?? '',
          vehicleClassNumber: doc.data()['vehicleClassNumber'] ?? '',
          vehicleName: doc.data()['vehicleName'] ?? '',
          vehicleImageUrl: doc.data()['vehicleImageUrl'] ?? '',
          particularList: partList,
          // .forEach((e)=> Particulars(
          //   particularName: e['particularName']
          // )).toList(),
          requestStatus: doc.data()['requestStatus'] ?? '',
          vehicleColor: doc.data()['vehicleColor'] ?? '',
          registrationNumber: doc.data()['registrationNumber'] ?? '',
          totalCost: doc.data()['totalCost'] ?? 0.0,
          paymentIsOnline: doc.data()['paymentIsOnline'] ?? false,
          
          );
    }).toList();
  }

      Map<String, dynamic> toMap(){
        return {
          'customerId': customerId,
          'garageId': garageId,
          'orderName': orderName,
          'requestDate': requestDate,
          'isUrgent': isUrgent,
          'googleMapsUrl': googleMapsUrl,
          'vehicleClassNumber': vehicleClassNumber,
          'vehicleName': vehicleName,
          'vehicleColor': vehicleColor,
          'registrationNumber': registrationNumber,
          'vehicleImageUrl': vehicleImageUrl,
          'particularList': particularList.map((e) => {
            'particularName': e.particularName,
            'isProduct': e.isProduct,
            'quantity': e.quantity,
            'pirce': e.pirce
          }).toList(),
          'requestStatus': requestStatus,
          'paymentIsOnline': paymentIsOnline,
          'totalCost': totalCost,
          'garageAddress': garageAddress,
          'garageName': garageName
        };
      }
}