import 'package:flutter/material.dart';
import 'package:getmech/services/authService.dart';
import 'package:getmech/utils/constants.dart';
import 'package:getmech/utils/dialog.dart';
import 'package:progress_dialog/progress_dialog.dart';
class LoginDriver extends StatefulWidget {
    final VoidCallback transition;
  LoginDriver({this.transition});

  @override
  _LoginDriverState createState() => _LoginDriverState();
}

class _LoginDriverState extends State<LoginDriver> {
    ProgressDialog pd;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formKey = new GlobalKey<FormState>();


    void validateAndSubmit() async {
      pd.style(message: "Logging in..");
      await pd.show();
      final result =
          await AuthService().logInWithEmailAndPassword(
            _emailController.text, 
            _passwordController.text);
      await pd.hide();
      if (!mounted) return null;
      if (result is bool) {
        if (result) {
          Navigator.of(context).pop();
        } else {
          DialogUtil()
              .showErrorDialog(context, "Login Failure", 'General Login Failure');
        }
      } else {
        DialogUtil().showErrorDialog(context, "Login Failure", result);
      }
    }

  @override
  void initState() {
    super.initState();
    pd = ProgressDialog(context, isDismissible: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('User Login'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                Container(
                    child: Text(
                  'Login to Your Account',
                  style: TextStyle(
                      color: textPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                )),
                Form(
                  key: formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email or Phone',
                      ),
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
                          'LOGIN',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: validateAndSubmit)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Text("Dont have an account?"),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: widget.transition,
                        child: GestureDetector(
                          onTap: ()=> widget.transition(),
                          child: Text(
                            'Register',
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
