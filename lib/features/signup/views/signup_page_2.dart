import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone/common/bloc/common_bloc.dart';
import 'package:instagram_clone/common/bloc/common_event.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:instagram_clone/common/widgets/custom_button.dart';
import 'package:instagram_clone/common/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/core/custom_router.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/core/session_details.dart';
import 'package:instagram_clone/features/home/view/home_page.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class SignUpPage2 extends StatefulWidget {
  static const routeName = '/sign-up2';

  const SignUpPage2({super.key});

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: deviceHeight -
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
                          child: BlocBuilder<PasswordBloc, bool>(
                            builder: (_, isHidden) {
                              return CustomTextFormField(
                                controller: _passwordController,
                                obscure: isHidden,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      right: deviceWidth * 0.005),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      context.read<PasswordBloc>().add(
                                            TogglePasswordVisibility(
                                              isHidden: !isHidden,
                                            ),
                                          );
                                    },
                                    icon: Icon(
                                      isHidden ? MdiIcons.eyeOff : MdiIcons.eye,
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
                                    if (!passwordRegex
                                        .hasMatch(password ?? '')) {
                                      return Constants
                                          .signUpPasswordRegExpMismatchErrorText;
                                    }
                                  }
                                  return null;
                                },
                              );
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
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                await registerUser(
                                  context,
                                  password: _passwordController.text.trim(),
                                );
                              }
                            },
                            textStyle:
                                lightTheme.textTheme.bodyMedium?.copyWith(
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
      ),
    );
  }

  Future<void> registerUser(
    BuildContext context, {
    required String password,
  }) async {
    if ((await SessionDetails().getUserEmail()).isNotEmpty &&
        password.isNotEmpty) {
      await SessionDetails()
          .userSignUp(
        context,
        email: await SessionDetails().getUserEmail(),
        password: password,
      )
          .then((valid) async {
        if (valid) {
          await SessionDetails().setLoginStatus(status: true);
          AppRouter.router.pushReplacementNamed(HomePage.routeName).then(
                (_) => _formKey.currentState?.reset(),
              );
        }
      });
    }
  }
}
