import 'package:flutter/material.dart';

class NavigatorService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> showAlertDialog(AlertDialog alertDialog) async {
    BuildContext? context = navigatorKey.currentContext;
    if (context != null) {
      return await showDialog(context: context, builder: (context) {
        return alertDialog;
      });
    }
  }

  static BuildContext? getCurrentContext() => navigatorKey.currentContext;

}