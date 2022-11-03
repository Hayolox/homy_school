import 'package:flutter/material.dart';

class FutureDialog {
  Future<void> alert(
      BuildContext context, String paramTitle, String paramMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(paramTitle),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(paramMessage),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
