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
  final bool requestAccepted;
  final String requestStatus;
  final String vehicleColor;
  final String registrationNumber;
  final double totalCost;

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
    this.requestAccepted,
    this.requestStatus,
    this.vehicleColor,
    this.registrationNumber,
    this.totalCost
    });
}