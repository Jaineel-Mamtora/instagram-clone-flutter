import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    print('${media.size.height}, ${media.size.width}');
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: media.size.height - media.padding.top,
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
                  height: media.size.height * (75 / media.size.height),
                ),
                InstagramLogoHeader(),
                SizedBox(
                  height: media.size.height * (75 / media.size.height),
                ),
                LoginForm(formKey: formKey),
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
