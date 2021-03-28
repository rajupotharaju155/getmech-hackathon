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
}