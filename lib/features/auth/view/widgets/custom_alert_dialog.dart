import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;

  const CustomAlertDialog({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(title, style: TextStyle(color: Color.fromRGBO(0, 200, 74, 1)),),
      content: Text(content, style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      actions: <Widget>[
        TextButton(
          child: Text('Entendi', style: TextStyle(color: Color.fromRGBO(0, 200, 74, 1)),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}