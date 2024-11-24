import 'package:flutter/material.dart';


extension ShowSnackBarExtension on BuildContext {
  void showSnackBar({required String message, required Color color}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}