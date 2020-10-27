import 'package:flutter/material.dart';

Future alert(BuildContext context,
    {String title,
    String message,
    String icon = "info",
    List<String> buttons = const ["OK"]}) {
  //Icon
  IconData _icon;
  Color _color;
  if (icon == "info") {
    _icon = Icons.info;
    _color = Colors.blue;
  } else if (icon == "error") {
    _icon = Icons.error;
    _color = Colors.red;
  } else if (icon == "warning") {
    _icon = Icons.report_problem;
    _color = Colors.yellow;
  } else if (icon == "complete") {
    _icon = Icons.check_circle;
    _color = Colors.green;
  }

  //Buttons
  List<Widget> _buttons = List.generate(buttons.length, (i) {
    return TextButton(
      child: Text(buttons[i]),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  });

  //Alert
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            content: Row(
              children: [
                Icon(
                  _icon,
                  color: _color,
                  size: 45.0,
                ),
                SizedBox(width: 20.0),
                Text(message),
              ],
            ),
            actions: _buttons);
      });
}
