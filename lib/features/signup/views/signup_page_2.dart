import 'dart:io';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:instagram_clone/common_widgets/custom_button.dart';
import 'package:instagram_clone/common_widgets/custom_text_form_field.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/view/home_page.dart';
import 'package:instagram_clone/features/signup/providers/signup_provider.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class SignUpPage2 extends StatefulWidget {
  static const routeName = '/sign-up2';

  const SignUpPage2({super.key});

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: deviceHeight - deviceTopPadding,
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
                  padding: EdgeInsets.only(
                    top: deviceHeight * 0.01,
                  ),
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
                    bottom: deviceHeight * 0.02,
                  ),
                  child: Text(
                    'Create a password',
                    style: lightTheme.textTheme.headlineLarge?.copyWith(
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: deviceWidth * 0.05,
                    right: deviceWidth * 0.05,
                    bottom: deviceHeight * 0.03,
                  ),
                  child: Text(
                    Constants.createPasswordRegExpText,
                    style: lightTheme.textTheme.bodyMedium?.copyWith(
                      letterSpacing: 1.2,
                      height: 1.5,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
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
                        child: Selector<SignUpProvider, bool>(
                          selector: (_, signUpProvider) =>
                              signUpProvider.obscure,
                          builder: (_, obscure, __) => CustomTextFormField(
                            obscure: obscure,
                            suffixIcon: Padding(
                              padding:
                                  EdgeInsets.only(right: deviceWidth * 0.005),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  context.read<SignUpProvider>().setObscure =
                                      !obscure;
                                },
                                icon: Icon(
                                  obscure ? MdiIcons.eyeOff : MdiIcons.eye,
                                  size: deviceWidth * 0.06,
                                ),
                              ),
                            ),
                            hintText: Constants.passwordHintText,
                            validator: (password) {
                              if (password?.isEmpty ?? false) {
                                return Constants.passwordEmptyErrorText;
                              } else {
                                RegExp passwordRegex =
                                    RegExp(Constants.passwordRegex);
                                if (!passwordRegex.hasMatch(password ?? '')) {
                                  return Constants
                                      .signUpPasswordRegExpMismatchErrorText;
                                }
                              }
                              return null;
                            },
                          ),
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
                    padding: EdgeInsets.only(
                      bottom: deviceHeight * 0.02,
                    ),
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
