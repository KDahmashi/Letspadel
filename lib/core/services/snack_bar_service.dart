import 'package:flutter/material.dart';

class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static void showSnackBar(SnackBar snackBar) {
    scaffoldKey.currentState?.showSnackBar(snackBar);
  }
}