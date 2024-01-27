import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:instagram_clone/common_widgets/custom_button.dart';
import 'package:instagram_clone/common_widgets/loader.dart';
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
        size: Size(deviceWidth / 2.5, deviceHeight * 0.06),
        borderColor: lightTheme.colorScheme.secondary.withOpacity(0.3),
        borderRadius: deviceWidth * 0.02,
        textStyle: lightTheme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        onPressed: () {
          LoaderManager().showLoader(context);
          Future.delayed(Duration(seconds: 1), () async {
            await FirebaseAuth.instance.signOut().then(
              (_) async {
                await SessionDetails().setLoginStatus(status: false);
                AppRouter.router.pushReplacement(LoginPage.routeName);
                LoaderManager().hideLoader();
              },
            );
          });
        },
      ),
    );
  }
}
