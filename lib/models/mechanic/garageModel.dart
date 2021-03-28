import 'package:cloud_firestore/cloud_firestore.dart';

class GarageModel{
  final String garageName;
  final String garageAddress;
  final String latitude;
  final String longitude;

  final String phoneNumber;
  final String email;

  final bool haveGst;
  final String gstNumber;
  final List<Mechanics> listOfMechanics;

  final List<SupportedVehicle> suportedVehicles;

  GarageModel({this.garageName, 
  this.garageAddress, 
  this.latitude, 
  this.longitude,
   this.phoneNumber, 
   this.email, 
   this.haveGst, 
   this.gstNumber, 
   this.listOfMechanics, 
   this.suportedVehicles});

      //! get competetions list
  List<GarageModel> garagesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print(doc.reference.id);
      // print(doc.data()['MoneyDistributionStatus']);
      return GarageModel(
          garageName: doc.data()['garageName'] ?? '',
           garageAddress: doc.data()['garageAddress'] ?? '',
          phoneNumber: doc.data()['phoneNumber'] ?? '',
          email: doc.data()['email'] ?? '',
          haveGst: doc.data()['haveGst'] ?? '',

          );
    }).toList();
  }



}


class Mechanics{
  final String name;
  final String speciality;

  Mechanics({this.name, this.speciality});
}

class SupportedVehicle{
  final int vehicleClassNumber;
  final String vehicleClassName;

  SupportedVehicle({this.vehicleClassNumber, this.vehicleClassName});
}