import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:instagram_clone/my_theme.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:instagram_clone/widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    print('${media.size.height}, ${media.size.width}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: media.size.height,
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
              SvgPicture.asset(
                Constants.pathToInstagramLogoSvg,
                height: media.size.height * (60 / media.size.height),
              ),
              SizedBox(
                height: media.size.height * (75 / media.size.height),
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: media.size.width * (16 / media.size.width),
                      ),
                      child: CustomTextFormField(
                        hintText: Constants.usernameHintText,
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
                        hintText: Constants.passwordHintText,
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
                          context.push(HomePage.routeName);
                        },
                        child: Text(
                          'Log In',
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
                        'Forgotten Password?',
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
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: media.size.width * (16 / media.size.width),
                  right: media.size.width * (16 / media.size.width),
                ),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
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
                    side: BorderSide(
                      color: MyColors.loginButtonColor,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    'Create new account',
                    style: lightTheme.textTheme.bodyLarge?.copyWith(
                      letterSpacing: 1.1,
                      color: MyColors.loginButtonColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: media.size.height * (16 / media.size.height),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Constants.pathToMetaLogoSvg,
                      height: media.size.height * (12 / media.size.height),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
