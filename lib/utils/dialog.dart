import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:women_safety_beproject/ui/constants.dart';

class DialogUtil {
  //   void showLoading(
  //   BuildContext context,
  //   String title,
  //   String content,
  // ) {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text(title),
  //         content:Container(
  //           width: 260,
  //           height: 60,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //                CircularProgressIndicator(
  //                 valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
  //                 backgroundColor: secondaryColor,
  //               ),
  //               SizedBox(width:8),
  //               Text(content, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  static void showLocationSendingLoading(
    BuildContext context,
    Function func,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Your Location is being sent to your contacts",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
          ),
          content: Container(
            height: 240,
            child: Column(
              children: [
                Container(
                  child: SpinKitFadingCircle(
                    size: 150,
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? secondaryColor : Colors.green,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: secondaryColor),
                        onPressed: () => func(),
                        child: Center(
                          child: Text(
                            "Stop Sending".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showErrorDialog(
    BuildContext context,
    String title,
    String content,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
              padding: EdgeInsets.all(5),
              color: Colors.red[50],
              child: Text(
                title,
                textAlign: TextAlign.center,
              )),
          content: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Text(content,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[800]))),
          actions: [
            TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }

  void showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kBackgroundColor,
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  void showConfirmationDialog(BuildContext context, String title,
      String content, String btnName, Function func) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Container(
              padding: EdgeInsets.all(5),
              color: secondaryColor,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )),
          content: Container(
              color: Colors.grey[100],
              padding: EdgeInsets.all(10),
              child: Text(
                content,
                textAlign: TextAlign.center,
              )),
          actions: [
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                )),
          TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () => func(),
                child: Text(
                  btnName,
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }

  void showWarningDialog(
    BuildContext context,
    String title,
    String content,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
              padding: EdgeInsets.all(5),
              color: secondaryColor,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )),
          content: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[800]),
              )),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }

  void showTaskDoneDialog(BuildContext context, String title, String content,
      bool isDone, Function func) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Container(
              padding: EdgeInsets.all(5),
              color: isDone ? Colors.green : Colors.red,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Icon(
                    isDone ? Icons.check_circle : Icons.cancel,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              )),
          content: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[800]),
              )),
          actions: [
            TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () => func(),
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      },
    );
  }
}
