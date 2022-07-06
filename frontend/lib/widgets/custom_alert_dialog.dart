import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertDialog {
  static void showAlertDialog({
    required BuildContext context,
    required String title,
    String? content,
    required String firstAction,
    required VoidCallback firstActionOnPressed,
    String? secondAction,
    VoidCallback? secondActionOnPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.sansita(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            content ?? '',
            style: GoogleFonts.sansita(
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: firstActionOnPressed,
              child: Text(firstAction),
            ),
            TextButton(
              onPressed: secondActionOnPressed,
              child: Text(secondAction ?? ''),
            ),
          ],
        );
      },
    );
  }
}
