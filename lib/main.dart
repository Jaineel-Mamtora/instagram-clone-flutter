import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:instagram_clone/common/bloc/common_bloc.dart';
import 'package:instagram_clone/core/custom_router.dart';
import 'package:instagram_clone/core/globals.dart';
import 'package:instagram_clone/core/session_details.dart';
import 'package:instagram_clone/di/service_locator.dart' as service_locator;
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import 'package:instagram_clone/features/home/bloc/home_event.dart';
import 'package:instagram_clone/features/home/presentation/bloc/search_post_feed_bloc.dart';
import 'package:instagram_clone/features/login/bloc/login_bloc.dart';
import 'package:instagram_clone/features/signup/bloc/signup_bloc.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  service_locator.init();

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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

  isLoggedIn = !SessionDetails().getUser().isEmpty();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    deviceWidth = media.size.width;
    deviceHeight = media.size.height;
    deviceTopPadding = media.padding.top;
    deviceBottomPadding = media.padding.bottom;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TabBloc()),
          BlocProvider(create: (_) => LikeBloc()),
          BlocProvider(create: (_) => HomeBloc()..add(FetchCommonPosts())),
          BlocProvider(create: (_) => SignupBloc()),
          BlocProvider(create: (_) => LoginBloc()),
          BlocProvider(create: (_) => PasswordBloc()),
          BlocProvider(create: (_) => service_locator.sl<SearchPostFeedBloc>()),
        ],
        child: MaterialApp.router(
          title: 'Instagram Clone',
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          scaffoldMessengerKey: scaffoldMessengerKey,
        ),
      ),
    );
  }
}
