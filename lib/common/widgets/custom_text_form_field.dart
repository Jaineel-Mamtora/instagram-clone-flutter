import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';

enum InputSize { small, normal, large }

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.obscure = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.size = InputSize.normal,
    this.filled = false,
    this.fillColor,
    this.prefixIcon,
    this.hasBorder = true,
  }) : assert(filled == true || fillColor == null);

  final String hintText;
  final String? Function(String?) validator;
  final bool obscure;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final InputSize size;
  final bool filled;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscure,
      style: lightTheme.textTheme.bodyMedium?.copyWith(
        // letterSpacing: 1.1,
        color: lightTheme.colorScheme.onSurface,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
      ),
      obscuringCharacter: '●',
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(maxHeight: 20.0),
        suffixIcon: suffixIcon,
        isCollapsed: true,
        isDense: true,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                hasBorder
                    ? lightTheme.colorScheme.secondary.withValues(alpha: 0.4)
                    : fillColor ?? Colors.white,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(deviceHeight * 0.01),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                hasBorder
                    ? lightTheme.colorScheme.error
                    : fillColor ?? Colors.white,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(deviceHeight * 0.01),
        ),
        errorStyle: lightTheme.textTheme.labelSmall?.copyWith(
          letterSpacing: 1.1,
          fontWeight: FontWeight.w500,
          color: lightTheme.colorScheme.error,
        ),
        errorMaxLines: 4,
        hintText: hintText,
        hintStyle: lightTheme.textTheme.bodyMedium?.copyWith(
          letterSpacing: 1.2,
          fontWeight: FontWeight.w500,
          color: lightTheme.colorScheme.onSurface.withValues(alpha: 0.4),
        ),
        alignLabelWithHint: true,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                hasBorder
                    ? lightTheme.colorScheme.error
                    : fillColor ?? Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(deviceHeight * 0.01),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                hasBorder
                    ? lightTheme.colorScheme.secondary
                    : fillColor ?? Colors.white,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(deviceHeight * 0.01),
        ),
        contentPadding: EdgeInsets.all(computeContentPadding()),
      ),
    );
  }

  double computeContentPadding() {
    switch (size) {
      case InputSize.small:
        return deviceWidth * 0.025;
      case InputSize.normal:
        return deviceWidth * 0.045;
      case InputSize.large:
        return deviceWidth * 0.045;
    }
  }
}
