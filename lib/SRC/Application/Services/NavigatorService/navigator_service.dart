import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigate {
  to(BuildContext context, Widget child, {Duration? duration}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.topToBottom,
            child: child,
            duration: duration ?? const Duration(milliseconds: 200)));
  }

  toReplace(BuildContext context, Widget child) {
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.topToBottom, child: child));
  }

  toReplaceAll(BuildContext context, Widget child) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => child),
      (route) => false,
    );
  }

  pop(BuildContext context) {
    Navigator.pop(context);
  }
}
