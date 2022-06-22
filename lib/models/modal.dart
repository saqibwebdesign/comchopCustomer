
import 'package:flutter/material.dart';

class modal   {
  Widget _dialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: const Text("Incorrect Password or Email "),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Okay"))
      ],
    );
  }


    _rotateDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        return _dialog(ctx);

      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}