import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:instagram_clone/common/widgets/custom_button.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/signup/views/signup_page_1.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: deviceHeight * 0.02,
        left: deviceWidth * 0.04,
        right: deviceWidth * 0.04,
      ),
      child: CustomButton(
        title: Constants.createNewAccountButtonText,
        isFullWidth: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: deviceHeight * 0.015,
          horizontal: deviceWidth * 0.02,
        ),
        onPressed: () {
          context.push(SignUpPage1.routeName);
        },
        textStyle: lightTheme.textTheme.bodyMedium?.copyWith(
          letterSpacing: 1.1,
          color: MyColors.loginButtonColor,
          fontWeight: FontWeight.w500,
        ),
        borderColor: MyColors.loginButtonColor,
      ),
    );
  }
}
