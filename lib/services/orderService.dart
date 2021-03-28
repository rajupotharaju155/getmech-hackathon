import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getmech/models/mechanic/orderRequestmodel.dart';

class OrderService{
    final CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('orders');

    // final CollectionReference garageCollection =
    //   FirebaseFirestore.instance.collection('garage');

  Stream<List<OrderRequestModel>> newOrdersStream(
  String mechanichId) {
    return orderCollection
        .where("mechanichId", isEqualTo: mechanichId)
        .where('')
        .where('requestStatus', isNotEqualTo: 'completed')
        .orderBy("requestDate", descending: false)
        .snapshots()
        .map(OrderRequestModel().ordersFromSnapshot);
  }

  Future<bool> createOrderRequest(OrderRequestModel order)async{
    try {
      await orderCollection.add(order.toMap());
      print("order requestmade");
      return true;
    } catch (e) {
      print("Error in order req: "+ e.toString());
      return false;
    }
    
  }


    Stream<List<OrderRequestModel>> allOrderListOfUser(
    String customerId) {
      return orderCollection
          .where("customerId", isEqualTo: customerId)
          .snapshots()
          .map(OrderRequestModel().ordersFromSnapshot);
    }


    Stream<List<OrderRequestModel>> allOrderListOfGarage(
    String garageId) {
      return orderCollection
          .where("garageId", isEqualTo: garageId)
          .snapshots()
          .map(OrderRequestModel().ordersFromSnapshot);
    }

  
}