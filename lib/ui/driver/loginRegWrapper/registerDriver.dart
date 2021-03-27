import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';
import '../driverMain.dart';

class RegisterDriver extends StatefulWidget {
  final VoidCallback transition;
  RegisterDriver({this.transition});

  @override
  _RegisterDriverState createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formKey = new GlobalKey<FormState>();

    void validateAndSubmit(){
      print("All validate");
      print(_emailController.text);
      print(_passwordController.text);
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
                Form(
                  key: formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
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
