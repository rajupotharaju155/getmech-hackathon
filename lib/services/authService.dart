
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'firestore_service.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final _firestoreService = new FirestoreService();
  //!Login

  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // await FirestoreService().updateFcmToken(result.user.uid);
      return result.user != null;
    } catch (e) {
      print(e);
      return e.message;
    }
  }

  // ! register with email and password
  Future registerWithEmailAndPassword(
    String email, String password,
    String mobileNumber, String name,
    ) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      String photoUrl;
      if (result != null) {
        String registeredBy = "Registered with Email and Password";
        await _firestoreService.createNewUser(
          user, 
          password,
          mobileNumber, 
          registeredBy, 
          photoUrl, 
          name, 
          email);
      }
      return result.user != null;
    } catch (e) {
      return e.message;
    }
  }

    // ! register with email and password
  Future registerGarage(
    String email, String password,
    String mobileNumber, String garageName,
    bool haveGst, String gstNumber,
     Map<String, bool> typeOfVehicles,
     String address
    ) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      String photoUrl;
      if (result != null) {
        String registeredBy = "Registered with Email and Password";
        await _firestoreService.createNewGarage(
          user, 
          password,
          mobileNumber, 
          registeredBy, 
          photoUrl, 
          garageName, 
          email,
          haveGst,
          gstNumber,
          typeOfVehicles,
          address,
          );
      }
      return result.user != null;
    } catch (e) {
      return e.message;
    }
  }

  //!check phone exists
  Future checkMobileNumberExist(String number)async{
     final snapShot = await FirebaseFirestore.instance
            .collection('users')
            .where('mobileNumber', isEqualTo: number)
            .get();
            // .getdocs();
       if (snapShot == null || snapShot.docs.isEmpty) {
         return false;
       }else{
         return true;
       } 
  }

  //!check email exists
  Future checkEmailExist(String email)async{
     final snapShot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .get();
       if (snapShot == null || snapShot.docs.isEmpty) {
         return false;
       }else{
         String pass;
         snapShot.docs.forEach((doc) {
          print("password is: "+ doc.data()['password']);
          pass = doc.data()['password'];
         });
         return pass;
       } 
  }

  
  //! get current user
  String currrentUser(){
    try {
      User user = auth.currentUser;
      if (user == null) {
        return null;
      } else {
        return user.uid;
      }
    } catch (e) {
      print("user was null with exception $e");
      return null;
    }
  }

  Future<bool> logOut() async {
    try {
      auth.signOut();
      print("Logout");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


  Future deleteAccount() async {
    try {
      User user = FirebaseAuth.instance.currentUser;
      print("User is: " + user.toString());
      if (user != null) {
        await user.delete();
      //  await FirestoreService().deleteUserDoc(uId);
        return true;
      } else {
        return "Session Expired Please login to continue";
      }
    } on PlatformException catch (err) {
      print("Printing err message:  " + err.message);
      return err.message;
    } catch (e) {
      print("Printing error message:  " + e.message);
      return e.toString();
    }
  }
}
