import 'package:flutter/material.dart';

import 'package:instagram_clone/my_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.obscure = false,
  });

  final String hintText;
  final String? Function(String?) validator;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return TextFormField(
      obscureText: obscure,
      obscuringCharacter: '●',
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightTheme.colorScheme.secondary.withOpacity(0.4),
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            media.size.height * 0.01,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightTheme.colorScheme.error,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            media.size.height * 0.01,
          ),
        ),
        errorStyle: lightTheme.textTheme.labelSmall?.copyWith(
          letterSpacing: 1.1,
          color: lightTheme.colorScheme.error,
        ),
        errorMaxLines: 4,
        hintText: hintText,
        hintStyle: lightTheme.textTheme.bodyLarge?.copyWith(
          letterSpacing: 1.1,
          color: lightTheme.colorScheme.secondary.withOpacity(0.6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightTheme.colorScheme.error,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            media.size.height * 0.01,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightTheme.colorScheme.secondary,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(
            media.size.height * 0.01,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: media.size.width * (16 / media.size.width),
          vertical: media.size.height * (16 / media.size.height),
        ),
      ),
    );
  }
}
