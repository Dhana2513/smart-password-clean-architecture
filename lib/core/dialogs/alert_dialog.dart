import 'package:flutter/material.dart';

showAlertDialog(
  BuildContext context, {
  @required String title,
  @required String subtitle,
  @required String continueButtonText,
  @required String cancelButtonText,
  @required VoidCallback cancelCall,
  @required VoidCallback continueCall,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: [
          TextButton(
            child: Text(cancelButtonText),
            onPressed: cancelCall,
          ),
          TextButton(
            child: Text(continueButtonText),
            onPressed: continueCall,
          ),
        ],
      );
    },
  );
}
