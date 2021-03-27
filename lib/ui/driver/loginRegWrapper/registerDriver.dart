import 'package:flutter/material.dart';
import 'package:getmech/services/authService.dart';
import 'package:getmech/utils/constants.dart';
import 'package:getmech/utils/dialog.dart';
import 'package:progress_dialog/progress_dialog.dart';
class RegisterDriver extends StatefulWidget {
  final VoidCallback transition;
  RegisterDriver({this.transition});

  @override
  _RegisterDriverState createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
  ProgressDialog pd;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final formKey = new GlobalKey<FormState>();

    void validateAndSubmit()async{
      print("All validate");
      print(_emailController.text);
      print(_passwordController.text);
      await pd.show();
       final result = await AuthService()
        .registerWithEmailAndPassword(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _phoneController.text.trim(),
          _nameController.text.trim(),
          );
      await pd.hide();
      if (result is bool) {
        if (result) {
          print("reg succesfull");
          Navigator.of(context).pop();
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => TakePhoneNumberToLink()));
        } else {
          DialogUtil().showErrorDialog(
              context, "Sign Up Failure", 'General Signup Failure');
        }
      } else {
        DialogUtil().showErrorDialog(context, "Sign Up Failure", result);
      }
      if (!mounted) return;

  }

  @override
  void initState() {
    super.initState();
    pd = ProgressDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Register User'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                Container(
                    child: Text(
                  'Please Register to continue',
                  style: TextStyle(
                      color: textPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Text("Forgot Password?"),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Toast.show("No Function", context);
                        },
                        child: Text(
                          'Click here',
                          style: TextStyle(color: Colors.blue[900]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[600],
                          onPrimary: Colors.white,
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: validateAndSubmit)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: widget.transition,
                        child: GestureDetector(
                          onTap: ()=> widget.transition(),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.blue[900]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
