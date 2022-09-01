import 'package:flutter/cupertino.dart';

void navigation(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => widget),
  );
}
