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