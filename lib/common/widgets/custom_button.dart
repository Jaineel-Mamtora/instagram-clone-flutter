import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    this.textStyle,
    required this.onPressed,
    this.contentPadding,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.borderRadius,
    this.isFullWidth = false,
  });

  final String title;
  final void Function() onPressed;
  final double? borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: Text(
          title,
          style: textStyle ??
              lightTheme.textTheme.labelLarge?.copyWith(
                color: lightTheme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
          textAlign: TextAlign.center,
        ),
      ),
      style: OutlinedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        side: BorderSide(
          color: borderColor,
          width: 1.5,
        ),
        fixedSize: isFullWidth ? Size.fromWidth(deviceWidth) : null,
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
