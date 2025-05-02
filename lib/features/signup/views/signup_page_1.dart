import 'dart:io';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:instagram_clone/common/widgets/custom_button.dart';
import 'package:instagram_clone/common/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/core/session_details.dart';
import 'package:instagram_clone/features/signup/views/signup_page_2.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class SignUpPage1 extends StatefulWidget {
  static const routeName = '/sign-up1';

  const SignUpPage1({super.key});

  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height:
                deviceHeight -
                deviceTopPadding -
                (Platform.isIOS ? deviceBottomPadding : 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: MyColors.loginBackgroundGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: deviceHeight * 0.01),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => context.pop(),
                    icon: Icon(
                      Platform.isIOS
                          ? Icons.arrow_back_ios_new_rounded
                          : Icons.arrow_back_rounded,
                      color: lightTheme.colorScheme.onSurface,
                      size: deviceWidth * 0.06,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: deviceWidth * 0.05,
                    right: deviceWidth * 0.05,
                    top: deviceHeight * 0.01,
                    bottom: deviceHeight * 0.03,
                  ),
                  child: Text(
                    'What\'s your email?',
                    style: lightTheme.textTheme.headlineLarge?.copyWith(
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: deviceWidth * 0.05,
                          right: deviceWidth * 0.05,
                          bottom: deviceHeight * 0.03,
                        ),
                        child: CustomTextFormField(
                          filled: true,
                          fillColor: Colors.white,
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          hintText: Constants.emailHintText,
                          validator: (email) {
                            if (email?.isEmpty ?? false) {
                              return Constants.emailEmptyErrorText;
                            } else if (!RegExp(
                              Constants.emailRegex,
                            ).hasMatch(email ?? '')) {
                              return Constants.emailRegExpMismatchErrorText;
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
                          title: Constants.nextButtonText,
                          isFullWidth: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: deviceHeight * 0.015,
                            horizontal: deviceWidth * 0.02,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await SessionDetails().setUserEmail(
                                email: _emailController.text.trim(),
                              );
                              _formKey.currentState?.reset();
                              await context
                                  .push(SignUpPage2.routeName)
                                  .then((_) => _formKey.currentState?.reset());
                            }
                          },
                          textStyle: lightTheme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.1,
                          ),
                          backgroundColor: MyColors.loginButtonColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: deviceHeight * 0.02),
                    child: Center(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * 0.04,
                            vertical: deviceHeight * 0.01,
                          ),
                          child: Text(
                            'Already have an account?',
                            style: lightTheme.textTheme.labelLarge?.copyWith(
                              color: MyColors.loginButtonColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
