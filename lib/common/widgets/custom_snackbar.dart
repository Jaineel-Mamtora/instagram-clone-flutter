import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';

void hideSnackBar() {
  scaffoldMessengerKey.currentState?.clearSnackBars();
}

void showSnackBar({
  required String message,
}) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: lightTheme.textTheme.bodyMedium?.copyWith(
          color: lightTheme.colorScheme.surface,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      margin: EdgeInsets.only(
        bottom: deviceBottomPadding + deviceHeight * 0.02,
        left: deviceWidth * 0.03,
        right: deviceWidth * 0.03,
      ),
    ),
  );
}
