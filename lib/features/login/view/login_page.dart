import 'dart:io';

import 'package:flutter/material.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/login/widgets/create_account_button.dart';
import 'package:instagram_clone/features/login/widgets/login_form.dart';
import 'package:instagram_clone/features/login/widgets/logo_header.dart';
import 'package:instagram_clone/features/login/widgets/meta_logo_footer.dart';
import 'package:instagram_clone/utils/constants.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    print('$deviceHeight, $deviceWidth');
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: deviceHeight * (75 / deviceHeight),
                ),
                InstagramLogoHeader(),
                SizedBox(
                  height: deviceHeight * (75 / deviceHeight),
                ),
                LoginForm(
                  formKey: formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                Spacer(),
                CreateAccountButton(),
                MetaLogoFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
