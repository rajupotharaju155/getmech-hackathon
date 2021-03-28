import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FirestoreService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

    final CollectionReference garageCollection =
      FirebaseFirestore.instance.collection('garage');


  Future<String> getUserNamefromUid(String uid) async {
    try {
      DocumentSnapshot userDoc = await userCollection.doc(uid).get();
      return userDoc.data()['name'];
    } catch (e) {
      print("uid not found: " + e.toString());
      return uid;
    }
  }

  Future<bool> checkIfUserIsdriver(String uid)async{
    final snapShot = await  FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get();
    if(snapShot == null || !snapShot.exists){
      return false;
    }else{
      return true;
    }
  }


//   Future uploadImage(String uid, File image, String type) async {
//     //upload image to firebase
//     try {
//       if (image != null) {
//         Reference  ref =
//             FirebaseStorage.instance.ref().child(uid + type.toUpperCase());
//         UploadTask  uploadTask = ref.putFile(image);
//         String imageUrl =
//              await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
//         print("image url is :" + imageUrl);
//         Map<String, dynamic> data = <String, dynamic>{
//           type: imageUrl,
//         };

//       } else {
//         print(" image was null");
//       }
//     } catch (e) {
//       print("Exception while uploading " + e.toString());
//     }
//   }

  Future<void> createNewUser(
      User user,
      String password,
      String mobileNumber,
      String registeredBy,
      String photoUrl,
      String name,
      String email) {

  return userCollection.doc(user.uid).set({
      'password': password,
      "timeCreated": Timestamp.now(),
      "registeredBy": registeredBy,
      "uid": user.uid,
      "mobileNumber": mobileNumber ?? '',
      "email": user.email ?? email ?? "NA",
      'profilePicUrl': photoUrl,
      'name': name,
      'status': 'active'
    }).then((value) async {
      print("new user registered");
      // await updateFcmToken(user.uid);
    });
  }

    Future<void> createNewGarage(
      User user,
      String password,
      String mobileNumber,
      String registeredBy,
      String photoUrl,
      String garageName,
      String email,
      bool haveGst,
      String gstNumber,
     Map<String, bool>  typeOfVehicles,
      String garageAddress,
      ) {

  return garageCollection.doc(user.uid).set({
      'password': password,
      "timeCreated": Timestamp.now(),
      "registeredBy": registeredBy,
      "uid": user.uid,
      "mobileNumber": mobileNumber ?? '',
      "email": user.email ?? email ?? "NA",
      'profilePicUrl': photoUrl,
      'garageName': garageName,
      'haveGst': haveGst,
      'gstNumber': gstNumber ?? '',
      'typeOfVehicles': typeOfVehicles,
      'garageAddress': garageAddress,
      'status': 'active'
    }).then((value) async {
      print("new user registered");
      // await updateFcmToken(user.uid);
    });
  }


  Future<void> linkMobileNumber(String uid, String mobileNumber) async {
    await userCollection
        .doc(uid)
        .update({'mobileNumber': mobileNumber}).then((value) {
      print("Mobile number entered in datatabase");
    });
  }

}
