import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    this.textStyle,
    required this.onPressed,
    this.size,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.borderRadius,
  });

  final String title;
  final void Function() onPressed;
  final double? borderRadius;
  final Size? size;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle ??
            lightTheme.textTheme.labelLarge?.copyWith(
              color: lightTheme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
      ),
      style: OutlinedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        fixedSize: size ??
            Size(
              deviceWidth,
              deviceHeight * 0.06,
            ),
        side: BorderSide(
          color: borderColor,
          width: 1.5,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? deviceHeight * 0.06,
          ),
        ),
      ),
    );
  }
}
