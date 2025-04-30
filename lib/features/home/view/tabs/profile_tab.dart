import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:instagram_clone/common/models/user.dart';
import 'package:instagram_clone/common/widgets/custom_button.dart';
import 'package:instagram_clone/common/widgets/loader.dart';
import 'package:instagram_clone/core/custom_router.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/core/session_details.dart';
import 'package:instagram_clone/features/login/view/login_page.dart';
import 'package:instagram_clone/my_theme.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        title: 'Logout',
        contentPadding: EdgeInsets.symmetric(
          vertical: deviceHeight * 0.015,
          horizontal: deviceWidth * 0.02,
        ),
        borderColor: lightTheme.colorScheme.secondary.withValues(alpha: 0.3),
        borderRadius: deviceWidth * 0.02,
        textStyle: lightTheme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        onPressed: () {
          LoaderManager().showLoader(context);
          Future.delayed(Duration(seconds: 1), () async {
            await auth.FirebaseAuth.instance.signOut().then((_) async {
              await SessionDetails().setUser(user: User.empty());
              AppRouter.router.pushReplacement(LoginPage.routeName);
              LoaderManager().hideLoader();
            });
          });
        },
      ),
    );
  }
}
