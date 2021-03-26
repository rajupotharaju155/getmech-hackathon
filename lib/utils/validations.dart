import 'package:string_validator/string_validator.dart';

class Validate {

  String validateEmailOrPhone(String value){
    if(isNumeric(value)){
        print("Number");
        if(value.length != 10){
          return "Invalid email or mobile number";
        }else{
          return null;
        }
      }
      else if(isEmail(value)){
        return null;
      }
      else{
        return "Invalid email or mobile number";
      }
  }
  static String validateMobileNumber(String value) {
    if (value.length < 10 || value.length > 10) {
      return "Please Enter 10 digit mobile number";
    } else if (!isNumeric(value)) {
      return "Please Enter numbers between 0-9";
    } else
      return null;
  }

  String validateEmail(String value) {
    if (value.length == 0) {
      return "Please Enter Email id";
    } else if (!isEmail(value)) {
      return "Please Enter valid Email";
    } else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 8 || value.length > 16) {
      return "Password must be between 8-16 characters";
    } else if (!value.contains(new RegExp(r'[A-Z]'))) {
      return "Password should contain atleast 1 Capital Letter";
    } else if (!value.contains(new RegExp(r'[a-z]'))) {
      return "Password should contain atleast 1 Small Letter";
    } else if (!value.contains(new RegExp(r'[0-9]'))) {
      return "Passord should contain atleast 1 Numerical";
    } else if (value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password should not contain special charactters \n!@#%^&*(),.?:{}|<>";
    } else
      return null;
  }

  String comparePasswords(String value, String _password) {
    if (value.length == 0) {
      return "Pelase confirm your password";
    } else if (!equals(value, _password)) {
      return "Passwords did not match";
    } else
      return null;
  }

  String validateLoginPass(String value) {
    if (value.length < 3) {
      return "Please Enter your Password";
    } else
      return null;
  }

  String validatePAN(String value){
  //  regex = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
    RegExp isPan = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}');
    if(isPan.hasMatch(value) && value.substring(3,4) == 'P'){
      print("PAN validated");
      return null;
    }else{
      return "Enter correct PAN";
    }
  }

  static String validateName(String value){
    if(value.length < 2 ){
      return "Name cannot be less then 2 characters";
    }else{
      return null;
    }
  }


 static String validateAddress(String value){
    if(value.length < 2 ){
      return "Address cannot be less then 2 characters";
    }else{
      return null;
    }
  }

  static String validatePin(String value){
    if(value.trim().length < 6 ){
      return "Please enter 6 digit PIN COde";
    }else{
      return null;
    }
  }

    static String validateAadhaarNumber(String value) {
    if (value.length < 16 || value.length > 16) {
      return "Please Enter 16 digit Aadhaar number";
    } else if (!isNumeric(value)) {
      return "Please Enter numbers between 0-9";
    } else
      return null;
  }

 static String validateAnyString(String value){
    if(value.length < 2 ){
      return "Please fill this field";
    }else{
      return null;
    }
  }

  static String validateDOB(DateTime date){
    if (date == null){
      return "Please select date";
    }else{
      return null;
    }
  }

}