import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:instagram_clone/common_widgets/custom_button.dart';
import 'package:instagram_clone/common_widgets/custom_text_form_field.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/view/home_page.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: deviceWidth * 0.05,
              right: deviceWidth * 0.05,
              bottom: deviceHeight * 0.02,
            ),
            child: CustomTextFormField(
              controller: emailController,
              hintText: Constants.emailHintText,
              validator: (email) {
                if (email?.isEmpty ?? false) {
                  return Constants.emailEmptyErrorText;
                } else if (!RegExp(Constants.emailRegex)
                    .hasMatch(email ?? '')) {
                  return Constants.emailRegExpMismatchErrorText;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: deviceWidth * 0.05,
              right: deviceWidth * 0.05,
              bottom: deviceHeight * 0.02,
            ),
            child: CustomTextFormField(
              controller: passwordController,
              obscure: true,
              hintText: Constants.passwordHintText,
              validator: (password) {
                if (password?.isEmpty ?? false) {
                  return Constants.passwordEmptyErrorText;
                } else {
                  RegExp passwordRegex = RegExp(Constants.passwordRegex);
                  if (!passwordRegex.hasMatch(password ?? '')) {
                    return Constants.passwordRegExpMismatchErrorText;
                  }
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: deviceWidth * 0.04,
              right: deviceWidth * 0.04,
              bottom: deviceHeight * 0.02,
            ),
            child: CustomButton(
              title: Constants.loginButtonText,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  formKey.currentState?.reset();
                  context.push(HomePage.routeName).then(
                        (_) => formKey.currentState?.reset(),
                      );
                }
              },
              textStyle: lightTheme.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
              backgroundColor: MyColors.loginButtonColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: deviceHeight * 0.02,
            ),
            child: InkWell(
              onTap: () {},
              child: Text(
                Constants.forgotPasswordButtonText,
                style: lightTheme.textTheme.bodyMedium?.copyWith(
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
