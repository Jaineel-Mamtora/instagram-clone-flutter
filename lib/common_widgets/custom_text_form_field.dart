import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/my_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.obscure = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
  });

  final String hintText;
  final String? Function(String?) validator;
  final bool obscure;
  final TextInputType textInputType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        suffixIcon: suffixIcon,
        isCollapsed: true,
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightTheme.colorScheme.secondary.withOpacity(0.4),
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            deviceHeight * 0.01,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightTheme.colorScheme.error,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            deviceHeight * 0.01,
          ),
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
          color: lightTheme.colorScheme.onSurface.withOpacity(0.4),
        ),
        alignLabelWithHint: true,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightTheme.colorScheme.error,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            deviceHeight * 0.01,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightTheme.colorScheme.secondary,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            deviceHeight * 0.01,
          ),
        ),
        contentPadding: EdgeInsets.only(
          left: deviceWidth * (16 / deviceWidth),
          right: deviceWidth * (16 / deviceWidth),
          top: deviceHeight * (16 / deviceHeight),
          bottom: deviceHeight * (18 / deviceHeight),
        ),
      ),
    );
  }
}
