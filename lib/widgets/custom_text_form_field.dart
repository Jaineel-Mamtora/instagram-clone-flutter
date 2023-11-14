import 'package:flutter/material.dart';

import 'package:instagram_clone/my_theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return TextFormField(
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
        hintText: hintText,
        hintStyle: TextStyle(
          letterSpacing: 1.1,
          color: lightTheme.colorScheme.secondary.withOpacity(0.6),
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
