import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/features/home/view/home_page.dart';
import 'package:instagram_clone/features/login/view/login_page.dart';
import 'package:instagram_clone/features/signup/providers/signup_provider.dart';
import 'package:instagram_clone/features/signup/views/signup_page_1.dart';
import 'package:instagram_clone/features/signup/views/signup_page_2.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: LoginPage.routeName,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (_, __) => HomePage(),
        // pageBuilder: (_, __) {
        //   return CustomTransitionPage(
        //     child: HomePage(),
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) =>
        //             SlideTransition(
        //       position: Tween<Offset>(
        //         begin: const Offset(1, 0), // Right to left
        //         end: Offset.zero,
        //       ).animate(animation),
        //       child: child,
        //     ),
        //   );
        // },
      ),
      GoRoute(
        path: LoginPage.routeName,
        builder: (_, __) => LoginPage(),
      ),
      GoRoute(
        path: SignUpPage1.routeName,
        builder: (_, __) => SignUpPage1(),
      ),
      GoRoute(
        path: SignUpPage2.routeName,
        builder: (_, __) => SignUpPage2(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    deviceWidth = media.size.width;
    deviceHeight = media.size.height;
    deviceTopPadding = media.padding.top;
    deviceBottomPadding = media.padding.bottom;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ],
        child: MaterialApp.router(
          title: 'Instagram Clone',
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
      ),
    );
  }
}
