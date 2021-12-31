import 'package:flutter/material.dart';

showAlertDialog(
  BuildContext context, {
  @required String title,
  @required String subtitle,
  @required String continueButtonText,
  @required VoidCallback continueCall,
  String cancelButtonText,
  VoidCallback cancelCall,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: [
          cancelButtonText == null
              ? SizedBox.shrink()
              : TextButton(
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
