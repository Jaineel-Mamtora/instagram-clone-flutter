import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:instagram_clone/common/bloc/common_bloc.dart';
import 'package:instagram_clone/common/bloc/common_event.dart';
import 'package:instagram_clone/common/widgets/custom_button.dart';
import 'package:instagram_clone/common/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/core/custom_router.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/core/session_details.dart';
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
            child: BlocBuilder<PasswordBloc, bool>(
              builder: (context, isHidden) {
                return CustomTextFormField(
                  controller: passwordController,
                  obscure: isHidden,
                  hintText: Constants.passwordHintText,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: deviceWidth * 0.005),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        context.read<PasswordBloc>().add(
                              TogglePasswordVisibility(isHidden: !isHidden),
                            );
                      },
                      icon: Icon(
                        isHidden ? MdiIcons.eyeOff : MdiIcons.eye,
                        size: deviceWidth * 0.06,
                      ),
                    ),
                  ),
                  validator: (password) {
                    if (password?.isEmpty ?? false) {
                      return Constants.passwordEmptyErrorText;
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
              title: Constants.loginButtonText,
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  await loginUser(
                    context,
                    formKey: formKey,
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
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

  Future<void> loginUser(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      await SessionDetails()
          .userLogin(context, email: email, password: password)
          .then((valid) async {
        if (valid) {
          await SessionDetails().setLoginStatus(status: true);
          AppRouter.router.pushReplacement(HomePage.routeName).then(
                (_) => formKey.currentState?.reset(),
              );
        }
      });
    }
  }
}
