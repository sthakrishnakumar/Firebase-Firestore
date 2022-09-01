import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigation(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => widget),
  );
}

void scaffold(BuildContext context, String content, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: color,
      duration: const Duration(milliseconds: 500),
    ),
  );
}
