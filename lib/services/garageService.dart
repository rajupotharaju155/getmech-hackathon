import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getmech/models/mechanic/garageModel.dart';


class GarageService{
    final CollectionReference garageCollection =
      FirebaseFirestore.instance.collection('garage');

    // final CollectionReference garageCollection =
    //   FirebaseFirestore.instance.collection('garage');

  Stream<List<GarageModel>> getGarages() {
    return garageCollection
        // .where("mechanichId", isEqualTo: mechanichId)
        // .where('')
        // .where('requestStatus', isNotEqualTo: 'completed')
        // .orderBy("requestDate", descending: false)
        .snapshots()
        .map(GarageModel().garagesFromSnapshot);
  }
}