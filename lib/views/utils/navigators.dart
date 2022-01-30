import 'package:flutter/material.dart';

class AppNavigator {
  static void navigateToRoute(String routeName, context) {
    Navigator.pushNamed(context, routeName);
  }

  static void navigateToRouteReplacement(String routeName, context) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void navigateToScreen(Widget screen, context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  static void navigateToScreenReplacement(Widget screen, context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
