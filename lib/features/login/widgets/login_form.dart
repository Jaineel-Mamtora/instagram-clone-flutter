import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:instagram_clone/common_widgets/custom_text_form_field.dart';
import 'package:instagram_clone/features/home/view/home_page.dart';
import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/utils/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: media.size.width * (16 / media.size.width),
            ),
            child: CustomTextFormField(
              hintText: Constants.usernameHintText,
              validator: (username) {
                if (username?.isEmpty ?? false) {
                  return Constants.usernameEmptyErrorText;
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: media.size.height * (16 / media.size.height),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: media.size.width * (16 / media.size.width),
            ),
            child: CustomTextFormField(
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
              top: media.size.height * (16 / media.size.height),
              left: media.size.width * (16 / media.size.width),
              right: media.size.width * (16 / media.size.width),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  formKey.currentState?.reset();
                  context.push(HomePage.routeName).then(
                        (_) => formKey.currentState?.reset(),
                      );
                }
              },
              child: Text(
                Constants.loginButtonText,
                style: lightTheme.textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                maximumSize: Size(
                  media.size.width,
                  media.size.height * (55 / media.size.height),
                ),
                minimumSize: Size(
                  media.size.width,
                  media.size.height * (55 / media.size.height),
                ),
                backgroundColor: MyColors.loginButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    media.size.height * (55 / media.size.height),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: media.size.height * (16 / media.size.height),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              Constants.forgotPasswordButtonText,
              style: lightTheme.textTheme.bodyLarge?.copyWith(
                letterSpacing: 1.1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: media.size.height * (16 / media.size.height),
          ),
        ],
      ),
    );
  }
}
