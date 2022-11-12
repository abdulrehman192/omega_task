import 'dart:io';
import 'package:flutter/material.dart';
class Common {

  static showSnackBar(String message, BuildContext context, [Color? color]) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showConfirmAlert(
      {required String title, required String content, required BuildContext context, required Function() onYes}) async
  {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    onYes();
                    Navigator.pop(context);
                  },
                  child: const Text("Yes")
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")
              )
            ],
          );
        }
    );
  }


  static openScreen({required BuildContext context, required dynamic screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static Future<bool> checkInternetConnectivity() async
  {
    bool check = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        check = true;
      }
      else {
        check = false;
      }
    } on SocketException catch (_) {
      check = false;
    }
    return check;
  }

}

enum MessageType { success, error, information }